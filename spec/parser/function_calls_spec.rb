describe Gobstones::Parser, "function calls" do

  it "parses a function call without args" do
    expected = FunctionCall.new 'f1'
    expect('f1()').to be_parsed_as(:expression).and_return(expected)
  end

  it "does not parse a function call without a valid identifier" do
    expect('F1()').to be_parsed_as(:expression).and_fail
  end

  it "parses a function call with one arg" do
    expected = FunctionCall.new 'func1', [verde]
    expect('func1(Verde)').to be_parsed_as(:expression).and_return(expected)
  end

  it "parses a function with many args" do
    first_arg = 42.to_gbs_num
    second_arg = NroBolitas.new verde
    third_arg = norte
    expected = FunctionCall.new 'func1', [first_arg, second_arg, third_arg]

    expect('func1(42, nroBolitas(Verde), Norte)').
      to be_parsed_as(:expression).and_return(expected)
  end

  it "parses a complex function call" do
    or_expr = Or.new 'a'.to_var_name, 'b'.to_var_name
    div = Div.new 10.to_gbs_num, 'c'.to_var_name
    paren_expr = EnclosedByParensExpression.new div
    num_expr = Mul.new 5.to_gbs_num, paren_expr
    func2_call = FunctionCall.new 'func2', [verde, Opuesto.new(norte)]
    func1_call = FunctionCall.new 'func1', [or_expr, num_expr, func2_call]
    expect('func1(a || b, 5*(10 div c), func2(Verde, opuesto(Norte)))').
      to be_parsed_as(:expression).and_return(func1_call)
  end

end
