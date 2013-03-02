describe Gobstones::Parser, "nested expressions" do

  it "should parse literals between ()" do
    '(  42 )'.should be_parsed_as(:expression).
      and_return(ParenthesesExpr.new(42.as_gbs_num))
    '(True )'.should be_parsed_as(:expression).
      and_return(ParenthesesExpr.new(True.new))
    '(Rojo )'.should be_parsed_as(:expression).
      and_return(ParenthesesExpr.new(Rojo.new))
    '(Verde)'.should be_parsed_as(:expression).
      and_return(ParenthesesExpr.new(Verde.new))
  end

  it "should parse primitive functions between ()" do
    puede_mover = ParenthesesExpr.new(PuedeMover.new(Norte.new))
    '(puedeMover(Norte))'.
      should be_parsed_as(:expression).and_return(puede_mover)
  end

  it "should parse nested arithmetic expressions between ()" do
    paren_expr = ParenthesesExpr.new Add.new(3.as_gbs_num, 5.as_gbs_num)
    expected = Mul.new paren_expr, 6.as_gbs_num
    '(3 + 5) * 6'.should be_parsed_as(:expression).and_return(expected)
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
    '(a && (b || c)) && d'.should be_parsed_as(:expression).and_return(result)
  end

end
