describe Poner do

  let(:context) { ProgramExecutionContext.for double('GobstonesProgram') }
  let(:green) { Verde.new }

  it "should execute" do
    Poner.new(green).evaluate(context)

    expect(context.head.number_of_balls(green)).to eq(1)
  end

  it "should undo" do
    context.head.put green

    Poner.new(green).undo context

    expect(context.head.number_of_balls(green)).to eq(0)
  end

  it "should return the opposite cmd" do
    expect(Poner.new(green).opposite).to eq(Sacar.new(green))
  end

  it "should fail if types don't match" do
    expect { Poner.new(Norte.new).evaluate(context) }.
      to raise_error(GobstonesTypeError, /is not a color/)
  end

end