describe "if command" do

  let(:context) { clean_context }
  let(:then_block) { CmdBlock.new [Poner.new(Verde.new)] }
  let(:else_block) { CmdBlock.new [Poner.new(Rojo.new)] }

  describe "if-then" do

    it "evaluates the 'then' command block if the condition is true" do
      if_cmd = IfCmd.new true_value, then_block
      if_cmd.evaluate context
      expect(context.head.are_there_balls?(Verde.new)).to be true
    end

    it "does not evaluate the 'then' command block if the condition is false" do
      if_cmd = IfCmd.new false_value, then_block
      if_cmd.evaluate context
      expect(context.head.are_there_balls?(Verde.new)).to be false
    end

    it "raises a type error if the condition is not boolean" do
      [Number.new(42), Norte.new, Verde.new].each do |value|
        if_cmd = IfCmd.new value, then_block
        expect { if_cmd.evaluate context }
          .to raise_error(GobstonesTypeError, /is not a boolean/)
      end

    end

  end

  describe "if-then-else" do

    it "evaluates the 'then' block and it does not evaluate the 'else' block" do
      if_cmd = IfElseCmd.new true_value, then_block, else_block
      if_cmd.evaluate context
      expect(context.head.are_there_balls?(Verde.new)).to be true
      expect(context.head.are_there_balls?(Rojo.new)).to be false
    end

    it "does not evaluate the 'then' block and it evaluates the 'else' block" do
      if_cmd = IfElseCmd.new false_value, then_block, else_block
      if_cmd.evaluate context
      expect(context.head.are_there_balls?(Verde.new)).to be false
      expect(context.head.are_there_balls?(Rojo.new)).to be true
    end

  end

end
