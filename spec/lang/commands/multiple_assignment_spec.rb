describe MultipleAssignment do

  let(:my_function_return) { ReturnFromFunction.new [42.to_gbs_num, verde, MinDir.new] }
  let(:my_function_def) { Function.new 'myFunction', no_arguments, empty_body, my_function_return }
  let(:program) { Program.new [my_function_def], no_return_statement }
  let(:context) { program_context_for program }
  let(:a) { 'a'.to_var_name }
  let(:b) { 'b'.to_var_name }
  let(:c) { 'c'.to_var_name }

  context "success" do

    it "evaluates and set all the variables with the return values of a function call" do
      var_tuple = VarTuple.new [a, b, c]
      function_call = FunctionCall.new 'myFunction', []
      assign = MultipleAssignment.new var_tuple, function_call
      assign.evaluate context
      expect(context.has_variable_named?('a')).to be true
      expect(context.get(a)).to eq(42.to_gbs_num)
      expect(context.has_variable_named?('b')).to be true
      expect(context.get(b)).to eq(verde)
      expect(context.has_variable_named?('c')).to be true
      expect(context.get(c)).to eq(norte)
    end

  end

  context "failure" do

    it "fails if there are more variables to be assigned on the left"

    it "fails if there are more things to assign on the right"

    it "fails if the expression on the right is not a function call"

  end
end
