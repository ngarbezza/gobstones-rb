# frozen_string_literal: true

RSpec.describe Mover do
  let(:context) { clean_context }

  it 'moves the head to the specified direction when evaluating' do
    described_class.new(norte).evaluate(context)

    expect_positioned_at(0, 1)
  end

  it 'undoes the given movement' do
    cmd = described_class.new(norte)

    cmd.evaluate context
    cmd.undo context

    expect_positioned_at(0, 0)
  end

  it 'returns the opposite command' do
    expect(described_class.new(norte).opposite).to eq(described_class.new(sur))
  end

  it 'fails if the argument is not a direction' do
    expect { described_class.new(verde).evaluate(context) }.to raise_error(GobstonesTypeError, /is not a direction/)
  end

  it 'fails when the resulting position is out of board' do
    expect { described_class.new(sur).evaluate(context) }.to raise_error(OutOfBoardError)
  end
end
