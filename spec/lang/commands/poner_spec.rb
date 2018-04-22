RSpec.describe Poner do
  let(:context) { clean_context }

  it 'puts a ball of the given color in the current cell when evaluating' do
    described_class.new(verde).evaluate(context)

    expect(context.head.number_of_balls(verde)).to eq(1)
  end

  it 'undoes the command' do
    context.head.put verde

    described_class.new(verde).undo context

    expect(context.head.number_of_balls(verde)).to eq(0)
  end

  it 'returns the opposite command' do
    expect(described_class.new(verde).opposite).to eq(Sacar.new(verde))
  end

  it 'fails if the argument is not a color' do
    expect { described_class.new(norte).evaluate(context) }.to raise_error(GobstonesTypeError, /is not a color/)
  end
end
