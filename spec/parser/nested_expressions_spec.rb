describe Gobstones::Parser, "nested expressions" do

  it "should parse literals between ()" do
    '(  42 )'.should be_parsed_as(:expression).
      and_return(ParenthesesExpr.new(Number.new(42)))
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
    add = Add.new Number.new(3), Number.new(5)
    paren_expr = ParenthesesExpr.new add
    expected = Mul.new paren_expr, Number.new(6)
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
