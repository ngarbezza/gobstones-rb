describe WhileCmd do

  let(:context) { ExecutionContext.new }
  let(:while_block) { CmdBlock.new [Poner.new(Verde.new)] }

  def condition(times)
    cond = double('while condition')
    expected_values = [True.new] * times + [False.new]
    cond.stub(:evaluate).and_return(*expected_values)
    cond
  end

  it "should evaluate the command block until the condition is not satisfied" do
    while_cmd = WhileCmd.new condition(3), while_block
    while_cmd.evaluate context
    context.head.number_of_balls(Verde.new).should == 3
  end

  it "should not evaluate the command block if the condition is not satisfied" do
    while_cmd = WhileCmd.new condition(0), while_block
    while_cmd.evaluate context
    context.head.are_there_balls?(Verde.new).should be_false
  end

  it "should raise a type error if the condition is not boolean" do
    while_cmd = WhileCmd.new Sur.new, while_block
    expect { while_cmd.evaluate context }
      .to raise_error(GbsTypeError, /is not a boolean/)
  end


end