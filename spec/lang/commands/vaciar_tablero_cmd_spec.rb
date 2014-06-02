describe VaciarTablero do

  let(:program) { Program.new [], nil }
  let(:context) { ProgramExecutionContext.for program }
  let(:red) { Rojo.new }

  it "empties the board in the context" do
    context.head.put red
    vaciar_tablero = VaciarTablero.new

    vaciar_tablero.evaluate context

    expect(context.board.empty?).to be true
  end

end
