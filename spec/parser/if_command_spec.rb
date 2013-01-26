describe Gobstones::Parser, "if statements" do

  describe "if" do

    it "should parse a statement with a simple boolean and an empty block" do
      if_cmd = IfCmd.new True.new, CmdBlock.new([])

      'if (True) {}'.should be_parsed_to if_cmd
      'if (True) {
      }'.should be_parsed_to if_cmd
      'if (True)
        {}'.should be_parsed_to if_cmd
    end

    it "should parse a statement with a simple boolean and a block with cmds" do
      cmd_block = CmdBlock.new [Poner.new(Verde.new), Skip.new]
      if_cmd = IfCmd.new False.new, cmd_block

      'if(False){Poner(Verde); Skip}'.should be_parsed_to if_cmd
    end

    it "should parse a statement with a complex boolean expression" do
      and_expr = And.new VarName.new('a'), False.new
      exp = Or.new PuedeMover.new(Norte.new), ParenthesesExpr.new(and_expr)
      if_cmd = IfCmd.new exp, CmdBlock.new([])

      'if (puedeMover(Norte) || (a && False)) {}'.should be_parsed_to if_cmd
    end

  end

  describe "if-else" do

    it "should parse a statement with an else block" do
      else_block = CmdBlock.new [Mover.new(Norte.new)]
      if_else_cmd = IfElseCmd.new False.new, CmdBlock.new([]), else_block

      'if (False) { } else { Mover(Norte) }'.should be_parsed_to if_else_cmd
    end

  end

end
