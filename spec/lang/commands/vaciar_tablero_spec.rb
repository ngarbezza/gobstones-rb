describe VaciarTablero do
  let(:context) { clean_context }

  it 'empties the board in the context' do
    context.head.put rojo
    VaciarTablero.new.evaluate context

    expect(context.board.empty?).to be(true)
  end
end
