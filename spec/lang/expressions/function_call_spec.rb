describe FunctionCall do

  let(:empty_args) { VarTuple.empty }
  let(:empty_body) { CommandBlock.empty }

  it "evaluates an existing function and returns its result when calling it" do
    return_statement = ReturnFromFunction.new [42.to_gbs_num]
    my_function = Function.new 'myFunction', empty_args, empty_body, return_statement
    program = Program.new [my_function], no_return_statement
    context = program_context_for program
    call = FunctionCall.new 'myFunction', []

    result = call.evaluate context

    expect(result).to eq(42.to_gbs_num)
  end

  it "evaluates an existing function with some arguments" do
    skip
  end

end
