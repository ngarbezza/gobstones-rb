describe Poner do

  let(:context) { ProgramExecutionContext.for double('GobstonesProgram') }
  let(:green) { Verde.new }

  it "should execute" do
    Poner.new(green).evaluate(context)

    context.head.number_of_balls(green).should == 1
  end

  it "should undo" do
    context.head.put green

    Poner.new(green).undo context

    context.head.number_of_balls(green).should == 0
  end

  it "should return the opposite cmd" do
    Poner.new(green).opposite.should == Sacar.new(green)
  end

  it "should fail if types don't match" do
    expect { Poner.new(Norte.new).evaluate(context) }.
      to raise_error(GbsTypeError, /is not a color/)
  end

end

