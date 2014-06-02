describe WhileCmd do

  let(:context) { clean_context }
  let(:while_block) { CmdBlock.new [Poner.new(Verde.new)] }

  def condition(times)
    double('while condition').tap do |condition|
      expected_values = [True.new] * times + [False.new]
      allow(condition).to receive(:evaluate).and_return(*expected_values)
    end
  end

  it "evaluates the command block until the condition is not satisfied" do
    while_cmd = WhileCmd.new condition(3), while_block

    while_cmd.evaluate context

    expect(context.head.number_of_balls(Verde.new)).to eq(3)
  end

  it "does not evaluate the command block if the condition is false" do
    while_cmd = WhileCmd.new condition(0), while_block

    while_cmd.evaluate context

    expect(context.head.are_there_balls?(Verde.new)).to be false
  end

  it "fails by type error if the condition is not boolean" do
    while_cmd = WhileCmd.new Sur.new, while_block

    expect { while_cmd.evaluate context }
      .to raise_error(GobstonesTypeError, /is not a boolean/)
  end

  it "fails by stack overflow if the condition is always true" do
    while_cmd = WhileCmd.new True.new, while_block

    expect { while_cmd.evaluate context }
      .to raise_error(GobstonesRuntimeError, /stack overflow/)
  end

end
