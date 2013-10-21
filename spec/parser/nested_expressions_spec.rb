describe Gobstones::Parser, "nested expressions" do

  it "should parse literals between ()" do
    expect('(  42 )').to be_parsed_as(:expression).
      and_return(ParenthesesExpr.new(42.to_gbs_num))
    expect('(True )').to be_parsed_as(:expression).
      and_return(ParenthesesExpr.new(True.new))
    expect('(Rojo )').to be_parsed_as(:expression).
      and_return(ParenthesesExpr.new(Rojo.new))
    expect('(Verde)').to be_parsed_as(:expression).
      and_return(ParenthesesExpr.new(Verde.new))
  end

  it "should parse primitive functions between ()" do
    puede_mover = ParenthesesExpr.new(PuedeMover.new(Norte.new))
    expect('(puedeMover(Norte))').
      to be_parsed_as(:expression).and_return(puede_mover)
  end

  it "should parse nested arithmetic expressions between ()" do
    paren_expr = ParenthesesExpr.new Add.new(3.to_gbs_num, 5.to_gbs_num)
    expected = Mul.new paren_expr, 6.to_gbs_num
    expect('(3 + 5) * 6').to be_parsed_as(:expression).and_return(expected)
  end

  it "should parse a nested expressions with many ()" do
    b = VarName.new 'b'
    c = VarName.new 'c'
    or_expr = Or.new b, c
    a = VarName.new 'a'
    inner_paren = ParenthesesExpr.new or_expr
    and_expr = And.new a, inner_paren
    outer_paren = ParenthesesExpr.new and_expr
    d = VarName.new 'd'
    result = And.new outer_paren, d
    expect('(a && (b || c)) && d').to be_parsed_as(:expression).and_return(result)
  end

end