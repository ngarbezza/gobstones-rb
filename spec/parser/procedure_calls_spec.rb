describe Gobstones::Parser, "procedure calls" do

  it "should parse a procedure call without args" do
    expect('P1()').to be_parsed_as(:command).and_return(ProcedureCall.new('P1'))
  end

  it "should not parse a procedure call without a valid identifier" do
    expect('p1()').to be_parsed_as(:command).and_fail
  end

  it "should parse a procedure call with one arg" do
    expected = ProcedureCall.new 'Proc1', [verde]
    expect('Proc1(Verde)').to be_parsed_as(:command).and_return(expected)
  end

  it "should parse a procedure with many args" do
    first_arg = 42.to_gbs_num
    second_arg = NroBolitas.new verde
    third_arg = Norte.new
    expected = ProcedureCall.new 'Proc1', [first_arg, second_arg, third_arg]

    expect('Proc1(42, nroBolitas(Verde), Norte)').
      to be_parsed_as(:command).and_return(expected)
  end

  it "should parse a complex procedure call" do
    or_expr = Or.new VarName.new('a'), VarName.new('b')
    paren_expr = EnclosedByParensExpression.new Div.new(10.to_gbs_num, VarName.new('c'))
    num_expr = Mul.new 5.to_gbs_num, paren_expr
    func_call = FunctionCall.new 'func', [verde, Opuesto.new(Norte.new)]
    proc_call = ProcedureCall.new 'Proc1', [or_expr, num_expr, func_call]
    expect('Proc1(a || b, 5*(10 div c), func(Verde, opuesto(Norte)))').
      to be_parsed_as(:command).and_return(proc_call)
  end

end
