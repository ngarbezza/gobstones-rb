describe Gobstones::Parser, "procedure calls" do

  it "should parse a procedure call without args" do
    'P1()'.should be_parsed_as(:command).and_return(ProcedureCall.new('P1'))
  end

  it "should not parse a procedure call without a valid identifier" do
    'p1()'.should be_parsed_as(:command).and_fail
  end

  it "should parse a procedure call with one arg" do
    expected = ProcedureCall.new 'Proc1', [Verde.new]
    'Proc1(Verde)'.should be_parsed_as(:command).and_return(expected)
  end

  it "should parse a procedure with many args" do
    first_arg = 42.to_gbs_num
    second_arg = NroBolitas.new Verde.new
    third_arg = Norte.new
    expected = ProcedureCall.new 'Proc1', [first_arg, second_arg, third_arg]

    'Proc1(42, nroBolitas(Verde), Norte)'.
      should be_parsed_as(:command).and_return(expected)
  end

  it "should parse a complex procedure call" do
    or_expr = Or.new VarName.new('a'), VarName.new('b')
    paren_expr = ParenthesesExpr.new Div.new(10.to_gbs_num, VarName.new('c'))
    num_expr = Mul.new 5.to_gbs_num, paren_expr
    func_call = FuncCall.new 'func', [Verde.new, Opuesto.new(Norte.new)]
    proc_call = ProcedureCall.new 'Proc1', [or_expr, num_expr, func_call]
    'Proc1(a || b, 5*(10 div c), func(Verde, opuesto(Norte)))'.
      should be_parsed_as(:command).and_return(proc_call)
  end

end