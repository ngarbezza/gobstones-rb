describe Gobstones::Parser, 'while statements' do
  it 'parses a statement with a simple boolean and an empty block' do
    while_cmd = While.new(true_value, empty_body)

    expect('while (True) {}').to be_parsed_as(:command).and_return(while_cmd)
    expect('while (True) {
    }').to be_parsed_as(:command).and_return(while_cmd)
    expect('while (True)
      {}').to be_parsed_as(:command).and_return(while_cmd)
  end

  it 'parses a statement with a simple boolean and a block with commands' do
    cmd_block = CommandBlock.new([Poner.new(verde), Skip.new])
    while_cmd = While.new(false_value, cmd_block)

    expect('while(False){Poner(Verde); Skip}').to be_parsed_as(:command).and_return(while_cmd)
  end

  it 'parses a statement with a complex boolean expression' do
    and_expr = And.new('a'.to_var_name, false_value)
    exp = Or.new(PuedeMover.new(norte), EnclosedByParensExpression.new(and_expr))
    while_cmd = While.new(exp, empty_body)

    expect('while (puedeMover(Norte) || (a && False)) {}').
      to be_parsed_as(:command).and_return(while_cmd)
  end
end
