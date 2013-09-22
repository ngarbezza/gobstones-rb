describe Sacar do

  let(:context) { ProgramExecutionContext.for double('GobstonesProgram') }
  let(:red) { Rojo.new }

  it "should execute" do
    3.times { context.head.put red }

    Sacar.new(red).evaluate context

    context.head.number_of_balls(red).should == 2
  end

  it "should undo" do
    Sacar.new(red).undo context

    context.head.number_of_balls(red).should == 1
  end

  it "should return the opposite cmd" do
    Sacar.new(red).opposite.should == Poner.new(red)
  end

  it "should fail if there are no balls in the board" do
    expect { Sacar.new(red).evaluate(context) }.
      to raise_error(EmptyCellError)
  end

  it "should fail if types don't match" do
    expect { Sacar.new(True.new).evaluate(context) }.
      to raise_error(GbsTypeError, /is not a color/)
  end

end