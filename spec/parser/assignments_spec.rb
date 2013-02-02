describe Gobstones::Parser, "assignments" do

  describe "simple" do

    it "should parse a valid assignment with a simple expression" do
      assignment = SimpleAssignment.new VarName.new('myDir'), Norte.new

      'myDir:=Norte'.should be_parsed_to(assignment)
      'myDir  :=   Norte'.should be_parsed_to(assignment)
    end

    it "should parse a valid assignment with a complex expression" do
      a, b = VarName.new('a'), VarName.new('b')
      exp = Or.new False.new, ParenthesesExpr.new(And.new(a, b))
      assignment = SimpleAssignment.new VarName.new('myVar'), exp

      'myVar := False || (a && b)'.should be_parsed_to(assignment)
    end

    it "should not parse with an invalid var name" do
      a = VarName.new 'a'
      assignment = SimpleAssignment.new VarName.new('MyWrongVar'), a

      'MyWrongVar := a'.should_not be_parsed_to(assignment)
    end

    it "should not parse with a command on the right side" do
      assignment = SimpleAssignment.new VarName.new('myVar'), Skip.new

      'myVar := Skip'.should_not be_parsed_to(assignment)
    end

  end

  describe "multiple" do

  end

end
