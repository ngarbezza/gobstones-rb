# frozen_string_literal: true

RSpec.describe Poner do
  subject(:poner_cmd) { described_class.new(verde) }

  let(:context) { clean_context }

  it 'puts a ball of the given color in the current cell when evaluating' do
    poner_cmd.evaluate(context)

    expect(context.head.number_of_balls(verde)).to eq(1)
  end

  it 'undoes the command' do
    context.head.put verde

    poner_cmd.undo(context)

    expect(context.head.number_of_balls(verde)).to eq(0)
  end

  it 'returns the opposite command' do
    expect(poner_cmd.opposite).to eq(Sacar.new(verde))
  end

  it 'fails if the argument is not a color' do
    expect { described_class.new(norte).evaluate(context) }.to raise_error(GobstonesTypeError, /is not a color/)
  end
end
