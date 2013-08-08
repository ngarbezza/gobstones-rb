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

  it "should set arguments in the new context and they can be used" do
    a_color = VarName.new 'a_color'
    a_direction = VarName.new 'a_direction'
    args = VarTuple.new [a_color, a_direction]
    mover_cmd = Mover.new a_direction
    poner_cmd = Poner.new a_color
    body = CmdBlock.new [mover_cmd, poner_cmd]
    procedure = Procedure.new 'MyProc', args, body

    procedure.evaluate program_context, [Negro.new, Norte.new]

    program_context.head.are_there_balls?(Negro.new).should be_true
    program_context.head.y_pos.should == 1
  end

  it "should not set arguments as var names in outer context" do
    a_direction = VarName.new 'a_direction'
    args = VarTuple.new [a_direction]
    procedure = Procedure.new 'MyProc', args, empty_body

    procedure.evaluate program_context, [Oeste.new]

    program_context.has_variable_named?('a_direction').should be_false
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
