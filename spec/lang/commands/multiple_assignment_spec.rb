describe MultipleAssignment do

  let(:context) { clean_context }
  let(:a) { VarName.new 'a' }
  let(:b) { VarName.new 'a' }
  let(:c) { VarName.new 'a' }

  context "success" do

    it "evaluates and set all the variables with the return values of a function call"

  end

  context "failure" do

    it "fails if there are more variables to be assigned on the left"

    it "fails if there are more things to assign on the right"

    it "fails if the expression on the right is not a function call"

  end
end
