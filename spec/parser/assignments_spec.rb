describe Gobstones::Parser, "assignments" do

  describe "single" do

    it "should parse a valid assignment with a simple expression" do
      assignment = SingleAssignment.new VarName.new('myDir'), norte

      expect('myDir:=Norte').
        to be_parsed_as(:command).and_return(assignment)
      expect('myDir  :=   Norte').
        to be_parsed_as(:command).and_return(assignment)
    end

    it "should parse a valid assignment with a complex expression" do
      a, b = VarName.new('a'), VarName.new('b')
      exp = Or.new false_value, EnclosedByParensExpression.new(And.new(a, b))
      assignment = SingleAssignment.new VarName.new('myVar'), exp

      expect('myVar := False || (a && b)').
        to be_parsed_as(:command).and_return(assignment)
    end

    it "should not parse with an invalid var name" do
      expect('MyWrongVar := a').to be_parsed_as(:command).and_fail
    end

    it "should not parse with a command on the right side" do
      expect('myVar := Skip').to be_parsed_as(:command).and_fail
    end

  end

  describe "multiple" do

    # TODO implement

  end

end
