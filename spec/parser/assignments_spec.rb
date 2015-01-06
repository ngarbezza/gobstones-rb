describe Gobstones::Parser, "assignments" do

  describe "single" do

    it "parses a valid assignment with a simple expression" do
      assignment = SingleAssignment.new VarName.new('myDir'), norte

      expect('myDir:=Norte').
        to be_parsed_as(:command).and_return(assignment)
      expect('myDir  :=   Norte').
        to be_parsed_as(:command).and_return(assignment)
    end

    it "parses a valid assignment with a complex expression" do
      a, b = VarName.new('a'), VarName.new('b')
      exp = Or.new false_value, EnclosedByParensExpression.new(And.new(a, b))
      assignment = SingleAssignment.new VarName.new('myVar'), exp

      expect('myVar := False || (a && b)').
        to be_parsed_as(:command).and_return(assignment)
    end

    it "does not parse with an invalid var name" do
      expect('MyWrongVar := a').to be_parsed_as(:command).and_fail
    end

    it "does not parse with a command on the right side" do
      expect('myVar := Skip').to be_parsed_as(:command).and_fail
    end

  end

  describe "multiple" do

    context "failures" do

      it 'fails if the expression on the left side is not a var tuple' do
        expect('myVar = funcCall()').to be_parsed_as(:command).and_fail
      end

    end

    it 'parses a valid assignment with a function call on the right side' do
      a_color = VarName.new 'aColor'
      a_direction = VarName.new 'aDirection'
      var_tuple = VarTuple.new [a_color, a_direction]
      func_call = FunctionCall.new 'myFunction', []
      assignment = MultipleAssignment.new var_tuple, func_call
      expect('(aColor, aDirection) := myFunction()').
          to be_parsed_as(:command).and_return(assignment)
    end

  end

end
