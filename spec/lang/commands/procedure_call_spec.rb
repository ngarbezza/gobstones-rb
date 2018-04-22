RSpec.describe ProcedureCall do
  it 'evaluates an existing procedure when calling it' do
    poner_cmd = Poner.new(verde)
    body = CommandBlock.new([poner_cmd])
    my_procedure = Procedure.new('MyProcedure', no_arguments, body)
    program = Program.new([my_procedure], no_return_statement)
    context = program_context_for(program)

    proc_call = described_class.new('MyProcedure', [])
    proc_call.evaluate context

    expect_balls(verde)
  end

  it 'allows to call a procedure from another procedure' do
    poner_cmd = Poner.new(azul)
    inner_procedure_body = CommandBlock.new([poner_cmd])
    inner_procedure = Procedure.new('Inner', no_arguments, inner_procedure_body)
    call_to_inner_procedure = described_class.new('Inner', [])
    outer_procedure_body = CommandBlock.new([call_to_inner_procedure])
    outer_procedure = Procedure.new('Outer', no_arguments, outer_procedure_body)
    program = Program.new([outer_procedure, inner_procedure], no_return_statement)
    program_context = program_context_for(program)

    call_to_outer_procedure = described_class.new('Outer', [])
    call_to_outer_procedure.evaluate program_context

    expect(program_context.head.are_there_balls?(azul)).to be(true)
  end

  it 'fails to execute an undefined procedure' do
    proc_call = described_class.new('UndefinedProcedure', [])

    expect { proc_call.evaluate clean_context }.
      to raise_error(DefinitionNotFound, DefinitionNotFound.message_for('UndefinedProcedure'))
  end
end
