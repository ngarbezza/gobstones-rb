describe "procedure calls" do

  it "should execute an existing procedure when calling it" do
    poner_cmd = Poner.new Verde.new
    args = VarTuple.new []
    body = CmdBlock.new [poner_cmd]
    my_procedure = Procedure.new 'MyProcedure', args, body
    program = Program.new [my_procedure], nil
    context = ProgramExecutionContext.for program

    proc_call = ProcCall.new 'MyProcedure', []
    proc_call.evaluate context

    context.head.are_there_balls?(Verde.new).should be_true
  end

  it "should fail to execute an undefined procedure" do
    pending
  end

end
