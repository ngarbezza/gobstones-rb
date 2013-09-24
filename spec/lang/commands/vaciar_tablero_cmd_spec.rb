describe VaciarTablero do

  let(:context) { ProgramExecutionContext.for double('GobstonesProgram') }
  let(:red) { Rojo.new }

  it "should empty the board in the context" do
    context.head.put red
    vaciar_tablero = VaciarTablero.new
    vaciar_tablero.evaluate context
    context.board.empty?.should be_true
  end

end