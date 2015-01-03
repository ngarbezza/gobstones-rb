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
    number_a = VarName.new('a')
    number_b = VarName.new('b')
    number_c = VarName.new('c')
    return_statement = ReturnFromFunction.new [Add.new(Add.new(number_a, number_b), number_c)]
    args = VarTuple.new [number_a, number_b, number_c]
    my_function = Function.new 'myFunction', args, empty_body, return_statement
    program = Program.new [my_function], no_return_statement
    context = program_context_for program
    call = FunctionCall.new 'myFunction', [1.to_gbs_num, 2.to_gbs_num, 3.to_gbs_num]

    result = call.evaluate context

    expect(result).to eq(6.to_gbs_num)
  end

end
