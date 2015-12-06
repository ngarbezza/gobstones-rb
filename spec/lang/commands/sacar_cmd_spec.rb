describe Sacar do

  let(:context) { clean_context }

  it 'takes off balls from the board when evaluating' do
    3.times { context.head.put rojo }

    Sacar.new(rojo).evaluate context

    expect(context.head.number_of_balls(rojo)).to eq(2)
  end

  it 'undoes a command' do
    Sacar.new(rojo).undo context

    expect(context.head.number_of_balls(rojo)).to eq(1)
  end

  it 'returns the opposite command' do
    opposite_command = Sacar.new(rojo).opposite

    expect(opposite_command).to eq(Poner.new(rojo))
  end

  it 'fails if there are no balls in the board' do
    expect { Sacar.new(rojo).evaluate(context) }.to raise_error(EmptyCellError)
  end

  it 'fails if the argument is not a color' do
    expect { Sacar.new(true_value).evaluate(context) }.
      to raise_error(GobstonesTypeError, /is not a color/)
  end

end
