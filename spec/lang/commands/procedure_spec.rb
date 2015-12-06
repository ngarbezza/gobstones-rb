describe Procedure do

  let(:context) { clean_context }

  it 'executes its body and leaves state in the program context' do
    poner_cmd = Poner.new(rojo)
    body = CommandBlock.new([poner_cmd])
    procedure = Procedure.new('MyProcedure', no_arguments, body)
    procedure.evaluate context
    expect(context.head.are_there_balls?(rojo)).to be(true)
  end

  it 'fails getting a variable which is in the outer context' do
    var_name = 'var'.to_var_name
    context.set var_name, verde

    poner_cmd = Poner.new(var_name)
    body = CommandBlock.new([poner_cmd])
    procedure = Procedure.new('MyProcedure', no_arguments, body)
    expect { procedure.evaluate context }.to raise_error(UndefinedVariableError)
  end

  it 'sets arguments in the new context so they can be used' do
    a_color = 'a_color'.to_var_name
    a_direction = 'a_direction'.to_var_name
    args = VarTuple.new([a_color, a_direction])
    mover_cmd = Mover.new(a_direction)
    poner_cmd = Poner.new(a_color)
    body = CommandBlock.new([mover_cmd, poner_cmd])
    procedure = Procedure.new('MyProc', args, body)

    procedure.evaluate context, [negro, norte]

    expect(context.head.are_there_balls?(negro)).to be(true)
    expect(context.head.y_pos).to eq(1)
  end

  it 'does not set arguments as var names in outer context' do
    a_direction = 'a_direction'.to_var_name
    args = VarTuple.new([a_direction])
    procedure = Procedure.new('MyProc', args, empty_body)

    procedure.evaluate context, [oeste]

    expect(context.has_variable_named?('a_direction')).to be(false)
  end

  it 'fails if it is executed with more arguments than expected' do
    procedure = Procedure.new('MyProcedure', no_arguments, empty_body)
    error_message = "Wrong number of arguments in procedure 'MyProcedure': expected 0, got 1"
    expect { procedure.evaluate context, [norte] }.to raise_error(WrongArgumentsError, error_message)
  end

  it 'fails if it is executed with less arguments than expected' do
    args = VarTuple.new(['arg1'.to_var_name, 'arg2'.to_var_name])
    procedure = Procedure.new('MyProcedure2', args, empty_body)
    error_message = "Wrong number of arguments in procedure 'MyProcedure2': expected 2, got 1"
    expect { procedure.evaluate context, [verde] }.to raise_error(WrongArgumentsError, error_message)
  end

end
