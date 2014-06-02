describe Poner do

  let(:context) { clean_context }
  let(:green) { Verde.new }

  it "puts a ball of the given color in the current cell when evaluating" do
    Poner.new(green).evaluate(context)

    expect(context.head.number_of_balls(green)).to eq(1)
  end

  it "undoes the command" do
    context.head.put green

    Poner.new(green).undo context

    expect(context.head.number_of_balls(green)).to eq(0)
  end

  it "returns the opposite command" do
    expect(Poner.new(green).opposite).to eq(Sacar.new(green))
  end

  it "fails if the argument is not a color" do
    expect { Poner.new(Norte.new).evaluate(context) }.
      to raise_error(GobstonesTypeError, /is not a color/)
  end

end
