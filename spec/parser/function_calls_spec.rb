describe Gobstones::Parser, "function calls" do

  it "should parse a function call without args" do
    expected = FuncCall.new 'f1'
    'f1()'.should be_parsed_as(:expression).and_return(expected)
  end

  it "should not parse a function call without a valid identifier" do
    'F1()'.should be_parsed_as(:expression).and_fail
  end

  it "should parse a function call with one arg" do
    expected = FuncCall.new 'func1', [Verde.new]
    'func1(Verde)'.should be_parsed_as(:expression).and_return(expected)
  end

  it "should parse a function with many args" do
    first_arg = Number.new 42
    second_arg = NroBolitas.new Verde.new
    third_arg = Norte.new
    expected = FuncCall.new 'func1', [first_arg, second_arg, third_arg]

    'func1(42, nroBolitas(Verde), Norte)'.
      should be_parsed_as(:expression).and_return(expected)
  end

  it "should parse a complex function call" do
    or_expr = Or.new VarName.new('a'), VarName.new('b')
    paren_expr = ParenthesesExpr.new Div.new(Number.new(10), VarName.new('c'))
    num_expr = Mul.new Number.new(5), paren_expr
    func2_call = FuncCall.new 'func2', [Verde.new, Opuesto.new(Norte.new)]
    func1_call = FuncCall.new 'func1', [or_expr, num_expr, func2_call]
    'func1(a || b, 5*(10 div c), func2(Verde, opuesto(Norte)))'.
      should be_parsed_as(:expression).and_return(func1_call)
  end

end
