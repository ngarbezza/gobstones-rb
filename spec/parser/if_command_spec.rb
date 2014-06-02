describe Gobstones::Parser, "if statements" do

  describe "if" do

    it "should parse a statement with a simple boolean and an empty block" do
      if_cmd = IfCmd.new true_value, CmdBlock.empty

      expect('if (True) {}').to be_parsed_as(:command).and_return(if_cmd)
      expect('if (True) {
      }').to be_parsed_as(:command).and_return(if_cmd)
      expect('if (True)
        {}').to be_parsed_as(:command).and_return(if_cmd)
    end

    it "should parse a statement with a simple boolean and a block with commands" do
      cmd_block = CmdBlock.new [Poner.new(verde), Skip.new]
      if_cmd = IfCmd.new False.new, cmd_block

      expect('if(False){Poner(Verde); Skip}').
        to be_parsed_as(:command).and_return(if_cmd)
    end

    it "should parse a statement with a complex boolean expression" do
      and_expr = And.new VarName.new('a'), False.new
      inner_and = EnclosedByParensExpression.new and_expr
      exp = Or.new PuedeMover.new(Norte.new), inner_and
      if_cmd = IfCmd.new exp, CmdBlock.empty

      expect('if (puedeMover(Norte) || (a && False)) {}').
        to be_parsed_as(:command).and_return(if_cmd)
    end

  end

  describe "if-else" do

    it "should parse a statement with an else block" do
      else_block = CmdBlock.new [Mover.new(Norte.new)]
      if_else_cmd = IfElseCmd.new False.new, CmdBlock.empty, else_block

      expect('if (False) { } else { Mover(Norte) }').
        to be_parsed_as(:command).and_return(if_else_cmd)
    end

  end

end
