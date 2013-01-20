describe Gobstones::Parser, "procedure calls" do

  it "should parse a procedure call without args" do
    expected = ProcCall.new 'P1'
    'P1()'.should be_parsed_to expected
  end

  it "should not parse a procedure call without a valid identifier" do
    expected = ProcCall.new 'p1'
    'p1()'.should_not be_parsed_to(expected)
  end

  it "should parse a procedure call with one arg" do
    expected = ProcCall.new 'Proc1', [Verde.new]
    'Proc1(Verde)'.should be_parsed_to(expected)
  end

  it "should parse a procedure with many args" do
    first_arg = Number.new 42
    second_arg = NroBolitas.new Verde.new
    third_arg = Norte.new
    expected = ProcCall.new 'Proc1', [first_arg, second_arg, third_arg]

    'Proc1(42, nroBolitas(Verde), Norte)'.should be_parsed_to(expected)
  end

  it "should parse a complex procedure call" do
    or_expr = Or.new VarName.new('a'), VarName.new('b')
    paren_expr = ParenthesesExpr.new Div.new(Number.new(10), VarName.new('c'))
    num_expr = Mul.new Number.new(5), paren_expr
    func_call = FuncCall.new 'func', [Verde.new, Opuesto.new(Norte.new)]
    proc_call = ProcCall.new 'Proc1', [or_expr, num_expr, func_call]
    'Proc1(a || b, 5*(10 div c), func(Verde, opuesto(Norte)))'.should be_parsed_to(proc_call)
  end

end
