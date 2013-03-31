describe "if command" do

  let(:context) { ExecutionContext.new }
  let(:then_block) { CmdBlock.new [Poner.new(Verde.new)] }
  let(:else_block) { CmdBlock.new [Poner.new(Rojo.new)] }

  describe "if-then" do

    it "should evaluate the block if the condition is true" do
      if_cmd = IfCmd.new True.new, then_block
      if_cmd.evaluate context
      context.head.are_there_balls?(Verde.new).should be_true
    end

    it "shoud not evaluate the block if the condition is false" do
      if_cmd = IfCmd.new False.new, then_block
      if_cmd.evaluate context
      context.head.are_there_balls?(Verde.new).should be_false
    end

    it "should raise a type error if the condition is not boolean" do
      [Number.new(42), Norte.new, Verde.new].each do |value|
        if_cmd = IfCmd.new value, then_block
        expect { if_cmd.evaluate context }
          .to raise_error(GbsTypeError, /is not a boolean/)
      end
    end

  end

  describe "if-then-else" do

    it "should evaluate the 'then' block and not evaluate the 'else' block" do
      if_cmd = IfElseCmd.new True.new, then_block, else_block
      if_cmd.evaluate context
      context.head.are_there_balls?(Verde.new).should be_true
      context.head.are_there_balls?(Rojo.new).should be_false
    end

    it "should not evaluate the 'then' block and evaluate the 'else' block" do
      if_cmd = IfElseCmd.new False.new, then_block, else_block
      if_cmd.evaluate context
      context.head.are_there_balls?(Verde.new).should be_false
      context.head.are_there_balls?(Rojo.new).should be_true
    end

  end

end
