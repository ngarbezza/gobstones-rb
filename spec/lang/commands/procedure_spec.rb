describe Procedure do

  let(:program_context) { ProgramExecutionContext.for Program.new([], nil) }
  let(:empty_args) { VarTuple.new [] }
  let(:empty_body) { CmdBlock.new [] }

  it "should execute its body and leave state in the program context" do
    poner_cmd = Poner.new Rojo.new
    body = CmdBlock.new [poner_cmd]
    procedure = Procedure.new 'MyProcedure', empty_args, body
    procedure.evaluate program_context
    program_context.head.are_there_balls?(Rojo.new).should be_true
  end

  it "should execute in a new clean context, without having variables defined in another contexts" do
    var_name = VarName.new 'var'
    program_context.set var_name, Verde.new

    poner_cmd = Poner.new var_name
    body = CmdBlock.new [poner_cmd]
    procedure = Procedure.new 'MyProcedure', empty_args, body
    expect { procedure.evaluate program_context }
      .to raise_error(UndefinedVariableError)
  end

  it "should fail if it is executed with more arguments than expected" do
    procedure = Procedure.new 'MyProcedure', empty_args, empty_body
    error_message = "Wrong number of arguments in procedure 'MyProcedure': expected 0, got 1"
    expect { procedure.evaluate program_context, [Norte.new] }
      .to raise_error(WrongArgumentsError, error_message)
  end

  it "should fail if it is executed with less arguments than expected" do
    arg1, arg2 = VarName.new('arg1'), VarName.new('arg2')
    args = VarTuple.new [arg1, arg2]
    procedure = Procedure.new 'MyProcedure2', args, empty_body
    error_message = "Wrong number of arguments in procedure 'MyProcedure2': expected 2, got 1"
    expect { procedure.evaluate program_context, [Verde.new] }
      .to raise_error(WrongArgumentsError, error_message)
  end

end
