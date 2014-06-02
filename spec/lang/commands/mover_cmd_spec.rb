describe Mover do

  let(:program) { Program.new [], nil }
  let(:context) { ProgramExecutionContext.for program }
  let(:north) { Norte.new }
  let(:south) { Sur.new }

  it "moves the head to the specified direction when evaluating" do
    Mover.new(north).evaluate(context)

    expect(context.head.x_pos).to eq(0)
    expect(context.head.y_pos).to eq(1)
  end

  it "undoes the given movement" do
    cmd = Mover.new north

    cmd.evaluate context
    cmd.undo context

    expect(context.head.x_pos).to eq(0)
    expect(context.head.y_pos).to eq(0)
  end

  it "returns the opposite command" do
    expect(Mover.new(north).opposite).to eq(Mover.new(south))
  end

  it "fails if the argument is not a direction" do
    expect { Mover.new(Verde.new).evaluate(context) }.
      to raise_error(GobstonesTypeError, /is not a direction/)
  end

  it "fails when the resulting position is out of board" do
    expect { Mover.new(south).evaluate(context) }.
      to raise_error(OutOfBoardError)
  end

end
