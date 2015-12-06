describe "#{IfCmd} and #{IfElseCmd}" do

  let(:context) { clean_context }
  let(:then_block) { CommandBlock.new([Poner.new(verde)]) }
  let(:else_block) { CommandBlock.new([Poner.new(rojo)]) }

  describe 'if-then' do

    it "evaluates the 'then' command block if the condition is true" do
      if_cmd = IfCmd.new(true_value, then_block)
      if_cmd.evaluate context
      expect(context.head.are_there_balls?(verde)).to be(true)
    end

    it "does not evaluate the 'then' command block if the condition is false" do
      if_cmd = IfCmd.new(false_value, then_block)
      if_cmd.evaluate context
      expect(context.head.are_there_balls?(verde)).to be(false)
    end

    it 'raises a type error if the condition is not boolean' do
      [42.to_gbs_num, norte, verde].each do |value|
        if_cmd = IfCmd.new(value, then_block)
        expect { if_cmd.evaluate context }.to raise_error(GobstonesTypeError, /is not a boolean/)
      end

    end

  end

  describe 'if-then-else' do

    it "evaluates the 'then' block and it does not evaluate the 'else' block" do
      if_cmd = IfElseCmd.new(true_value, then_block, else_block)
      if_cmd.evaluate context
      expect(context.head.are_there_balls?(verde)).to be(true)
      expect(context.head.are_there_balls?(rojo)).to be(false)
    end

    it "does not evaluate the 'then' block and it evaluates the 'else' block" do
      if_cmd = IfElseCmd.new(false_value, then_block, else_block)
      if_cmd.evaluate context
      expect(context.head.are_there_balls?(verde)).to be(false)
      expect(context.head.are_there_balls?(rojo)).to be(true)
    end

  end
end
