describe Mover do

  let(:context) { ProgramExecutionContext.for double('GobstonesProgram') }
  let(:north) { Norte.new }
  let(:south) { Sur.new }

  it "should run" do
    Mover.new(north).evaluate(context)

    expect(context.head.x_pos).to eq(0)
    expect(context.head.y_pos).to eq(1)
  end

  it "should undo" do
    cmd = Mover.new(north)

    cmd.evaluate context
    cmd.undo context

    expect(context.head.x_pos).to eq(0)
    expect(context.head.y_pos).to eq(0)
  end

  it "should return opposite cmd" do
    expect(Mover.new(north).opposite).to eq(Mover.new(south))
  end

  it "should fail if types don't match" do
    expect { Mover.new(Verde.new).evaluate(context) }.
      to raise_error(GobstonesTypeError, /is not a direction/)
  end

  it "should fail when out of board" do
    expect { Mover.new(south).evaluate(context) }.
      to raise_error(OutOfBoardError)
  end

end