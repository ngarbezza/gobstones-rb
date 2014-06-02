describe Gobstones::Parser, "while statements" do

  it "should parse a statement with a simple boolean and an empty block" do
    while_cmd = WhileCmd.new true_value, CmdBlock.empty

    expect('while (True) {}').to be_parsed_as(:command).and_return(while_cmd)
    expect('while (True) {
    }').to be_parsed_as(:command).and_return(while_cmd)
    expect('while (True)
      {}').to be_parsed_as(:command).and_return(while_cmd)
  end

  it "should parse a statement with a simple boolean and a block with commands" do
    cmd_block = CmdBlock.new [Poner.new(verde), Skip.new]
    while_cmd = WhileCmd.new false_value, cmd_block

    expect('while(False){Poner(Verde); Skip}').
      to be_parsed_as(:command).and_return(while_cmd)
  end

  it "should parse a statement with a complex boolean expression" do
    and_expr = And.new VarName.new('a'), False.new
    exp = Or.new PuedeMover.new(Norte.new), EnclosedByParensExpression.new(and_expr)
    while_cmd = WhileCmd.new exp, CmdBlock.empty

    expect('while (puedeMover(Norte) || (a && False)) {}').
      to be_parsed_as(:command).and_return(while_cmd)
  end

end
