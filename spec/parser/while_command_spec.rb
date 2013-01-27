describe Gobstones::Parser, "while statements" do

  it "should parse a statement with a simple boolean and an empty block" do
    while_cmd = WhileCmd.new True.new, CmdBlock.new([])

    'while (True) {}'.should be_parsed_to while_cmd
    'while (True) {
    }'.should be_parsed_to while_cmd
    'while (True)
      {}'.should be_parsed_to while_cmd
  end

  it "should parse a statement with a simple boolean and a block with cmds" do
    cmd_block = CmdBlock.new [Poner.new(Verde.new), Skip.new]
    while_cmd = WhileCmd.new False.new, cmd_block

    'while(False){Poner(Verde); Skip}'.should be_parsed_to while_cmd
  end

  it "should parse a statement with a complex boolean expression" do
    and_expr = And.new VarName.new('a'), False.new
    exp = Or.new PuedeMover.new(Norte.new), ParenthesesExpr.new(and_expr)
    while_cmd = WhileCmd.new exp, CmdBlock.new([])

    'while (puedeMover(Norte) || (a && False)) {}'.should be_parsed_to while_cmd
  end

end