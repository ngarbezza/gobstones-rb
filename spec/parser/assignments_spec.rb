# frozen_string_literal: true

RSpec.describe Gobstones::Parser, 'assignments' do
  describe 'single' do
    it 'parses a valid assignment with a simple expression' do
      assignment = SingleAssignment.new('myDir'.to_var_name, norte)

      expect('myDir:=Norte').to be_parsed_as(:command).and_return(assignment)
      expect('myDir  :=   Norte').to be_parsed_as(:command).and_return(assignment)
    end

    it 'parses a valid assignment with a complex expression' do
      a = 'a'.to_var_name
      b = 'b'.to_var_name
      exp = Or.new(false_value, EnclosedByParensExpression.new(And.new(a, b)))
      assignment = SingleAssignment.new('myVar'.to_var_name, exp)

      expect('myVar := False || (a && b)').to be_parsed_as(:command).and_return(assignment)
    end

    it 'does not parse with an invalid var name' do
      expect('MyWrongVar := a').to be_parsed_as(:command).and_fail
    end

    it 'does not parse with a command on the right side' do
      expect('myVar := Skip').to be_parsed_as(:command).and_fail
    end
  end

  describe 'multiple' do
    context 'when input causes a failure' do
      it 'fails if the expression on the left side is not a var tuple' do
        expect('myVar = funcCall()').to be_parsed_as(:command).and_fail
      end
    end

    it 'parses a valid assignment with a function call on the right side' do
      var_tuple = VarTuple.with_names(%w[aColor aDirection])
      func_call = FunctionCall.new('myFunction', [])
      assignment = MultipleAssignment.new(var_tuple, func_call)

      expect('(aColor, aDirection) := myFunction()').to be_parsed_as(:command).and_return(assignment)
    end
  end
end
