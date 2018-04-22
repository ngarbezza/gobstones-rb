RSpec.describe Gobstones::Parser, 'if statements' do
  describe 'if' do
    it 'parses a statement with a simple boolean and an empty block' do
      if_cmd = If.new(true_value, empty_body)

      expect('if (True) {}').to be_parsed_as(:command).and_return(if_cmd)
      expect('if (True) {
      }').to be_parsed_as(:command).and_return(if_cmd)
      expect('if (True)
        {}').to be_parsed_as(:command).and_return(if_cmd)
    end

    it 'parses a statement with a simple boolean and a block with commands' do
      cmd_block = CommandBlock.new([Poner.new(verde), Skip.new])
      if_cmd = If.new(false_value, cmd_block)

      expect('if(False){Poner(Verde); Skip}').to be_parsed_as(:command).and_return(if_cmd)
    end

    it 'parses a statement with a complex boolean expression' do
      and_expr = And.new('a'.to_var_name, false_value)
      inner_and = EnclosedByParensExpression.new(and_expr)
      exp = Or.new(PuedeMover.new(norte), inner_and)
      if_cmd = If.new(exp, empty_body)

      expect('if (puedeMover(Norte) || (a && False)) {}').to be_parsed_as(:command).and_return(if_cmd)
    end
  end

  describe 'if-else' do
    it 'parses a statement with an else block' do
      else_block = CommandBlock.new([Mover.new(norte)])
      if_else_cmd = IfThenElse.new(false_value, empty_body, else_block)

      expect('if (False) { } else { Mover(Norte) }').to be_parsed_as(:command).and_return(if_else_cmd)
    end
  end
end
