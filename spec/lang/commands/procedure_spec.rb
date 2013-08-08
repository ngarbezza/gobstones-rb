describe Procedure do

  let(:program_context) { ProgramExecutionContext.for Program.new([], nil) }

  it "should execute its body and leave state in the program context" do
    poner_cmd = Poner.new Rojo.new
    body = CmdBlock.new [poner_cmd]
    procedure = Procedure.new 'MyProcedure', [], body
    procedure.evaluate program_context
    program_context.head.are_there_balls?(Rojo.new).should be_true
  end

  it "should execute in a new clean context, without having variables defined in another contexts" do
    var_name = VarName.new 'var'
    program_context.set var_name, Verde.new

    poner_cmd = Poner.new var_name
    body = CmdBlock.new [poner_cmd]
    procedure = Procedure.new 'MyProcedure', [], body
    expect { procedure.evaluate program_context }
      .to raise_error(UndefinedVariableError)
  end

end
