describe "procedure calls" do

  let(:empty_args) { VarTuple.new [] }
  let(:empty_body) { CmdBlock.empty }

  it "evaluates an existing procedure when calling it" do
    poner_cmd = Poner.new Verde.new
    body = CmdBlock.new [poner_cmd]
    my_procedure = Procedure.new 'MyProcedure', empty_args, body
    program = Program.new [my_procedure], nil
    context = ProgramExecutionContext.for program

    proc_call = ProcedureCall.new 'MyProcedure', []
    proc_call.evaluate context

    expect(context.head.are_there_balls?(Verde.new)).to be true
  end

  it "allows to call a procedure from another procedure" do
    poner_cmd = Poner.new Azul.new
    inner_procedure_body = CmdBlock.new [poner_cmd]
    inner_procedure = Procedure.new 'Inner', empty_args, inner_procedure_body
    call_to_inner_procedure = ProcedureCall.new 'Inner', []
    outer_procedure_body = CmdBlock.new [call_to_inner_procedure]
    outer_procedure = Procedure.new 'Outer', empty_args, outer_procedure_body
    program = Program.new [outer_procedure, inner_procedure], nil
    program_context = ProgramExecutionContext.for program

    call_to_outer_procedure = ProcedureCall.new 'Outer', []
    call_to_outer_procedure.evaluate program_context

    expect(program_context.head.are_there_balls?(Azul.new)).to be true
  end

  it "fails to execute an undefined procedure" do
    program = Program.new [], nil
    context = ProgramExecutionContext.for program
    proc_call = ProcedureCall.new 'UndefinedProcedure', []

    expect { proc_call.evaluate context }
      .to raise_error(DefinitionNotFound, DefinitionNotFound.message_for('UndefinedProcedure'))
  end

end
