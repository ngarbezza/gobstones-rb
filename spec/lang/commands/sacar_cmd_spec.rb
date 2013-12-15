describe Sacar do

  let(:context) { ProgramExecutionContext.for double('GobstonesProgram') }
  let(:red) { Rojo.new }

  it "take off balls from the board when evaluating" do
    3.times { context.head.put red }

    Sacar.new(red).evaluate context

    expect(context.head.number_of_balls(red)).to eq(2)
  end

  it "undoes a command" do
    Sacar.new(red).undo context

    expect(context.head.number_of_balls(red)).to eq(1)
  end

  it "returns the opposite command" do
    opposite_command = Sacar.new(red).opposite

    expect(opposite_command).to eq(Poner.new(red))
  end

  it "fails if there are no balls in the board" do
    expect { Sacar.new(red).evaluate(context) }.
      to raise_error(EmptyCellError)
  end

  it "fails if the argument is not a color" do
    expect { Sacar.new(True.new).evaluate(context) }.
      to raise_error(GobstonesTypeError, /is not a color/)
  end

end
