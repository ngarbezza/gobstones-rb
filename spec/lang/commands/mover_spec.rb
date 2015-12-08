describe Mover do

  let(:context) { clean_context }

  it 'moves the head to the specified direction when evaluating' do
    Mover.new(norte).evaluate(context)

    expect(context.head.x_pos).to eq(0)
    expect(context.head.y_pos).to eq(1)
  end

  it 'undoes the given movement' do
    cmd = Mover.new(norte)

    cmd.evaluate context
    cmd.undo context

    expect(context.head.x_pos).to eq(0)
    expect(context.head.y_pos).to eq(0)
  end

  it 'returns the opposite command' do
    expect(Mover.new(norte).opposite).to eq(Mover.new(sur))
  end

  it 'fails if the argument is not a direction' do
    expect { Mover.new(verde).evaluate(context) }.to raise_error(GobstonesTypeError, /is not a direction/)
  end

  it 'fails when the resulting position is out of board' do
    expect { Mover.new(sur).evaluate(context) }.to raise_error(OutOfBoardError)
  end

end
