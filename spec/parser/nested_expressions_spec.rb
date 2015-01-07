describe Gobstones::Parser, "nested expressions" do

  it "parses literals between ()" do
    expect('(  42 )').to be_parsed_as(:expression).
      and_return(EnclosedByParensExpression.new(42.to_gbs_num))
    expect('(True )').to be_parsed_as(:expression).
      and_return(EnclosedByParensExpression.new(true_value))
    expect('(Rojo )').to be_parsed_as(:expression).
      and_return(EnclosedByParensExpression.new(rojo))
    expect('(Verde)').to be_parsed_as(:expression).
      and_return(EnclosedByParensExpression.new(verde))
  end

  it "parses primitive functions between ()" do
    puede_mover = EnclosedByParensExpression.new(PuedeMover.new(norte))
    expect('(puedeMover(Norte))').
      to be_parsed_as(:expression).and_return(puede_mover)
  end

  it "parses nested arithmetic expressions between ()" do
    paren_expr = EnclosedByParensExpression.new Add.new(3.to_gbs_num, 5.to_gbs_num)
    expected = Mul.new paren_expr, 6.to_gbs_num
    expect('(3 + 5) * 6').to be_parsed_as(:expression).and_return(expected)
  end

  it "parses a nested expressions with many ()" do
    or_expr = Or.new 'b'.to_var_name, 'c'.to_var_name
    inner_paren = EnclosedByParensExpression.new or_expr
    and_expr = And.new 'a'.to_var_name, inner_paren
    outer_paren = EnclosedByParensExpression.new and_expr
    result = And.new outer_paren, 'd'.to_var_name
    expect('(a && (b || c)) && d').to be_parsed_as(:expression).and_return(result)
  end

end
