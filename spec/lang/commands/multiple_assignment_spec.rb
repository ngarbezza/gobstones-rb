RSpec.describe MultipleAssignment do
  let(:my_function_return) { ReturnFromFunction.new([42.to_gbs_num, verde, MinDir.new]) }
  let(:my_function_def) { Function.new('myFunction', no_arguments, empty_body, my_function_return) }
  let(:call_to_my_function) { FunctionCall.new('myFunction', []) }
  let(:program) { Program.new([my_function_def], no_return_statement) }
  let(:context) { program_context_for(program) }
  let(:a) { 'a'.to_var_name }
  let(:b) { 'b'.to_var_name }
  let(:c) { 'c'.to_var_name }
  let(:d) { 'd'.to_var_name }

  def expect_assignment(variable, value)
    expect(context.has_variable_named?(variable.name)).to be(true)
    expect(context.get(variable)).to eq(value)
  end

  context 'when assignment can be made' do
    it 'evaluates and set all the variables with the return values of a function call' do
      var_tuple = VarTuple.new([a, b, c])
      assign = described_class.new(var_tuple, call_to_my_function)
      assign.evaluate context

      expect_assignment(a, 42.to_gbs_num)
      expect_assignment(b, verde)
      expect_assignment(c, norte)
    end
  end

  context 'when assignment cannot be made' do
    it 'fails if there are more variables to be assigned on the left' do
      var_tuple = VarTuple.new([a, b, c, d])
      assign = described_class.new(var_tuple, call_to_my_function)

      error_message = 'Wrong number of arguments in assignment: expected 4, got 3'
      expect { assign.evaluate context }.to raise_error(Gobstones::Runner::WrongArgumentsError, error_message)
    end

    it 'fails if there are more things to assign on the right' do
      var_tuple = VarTuple.new([a, b])
      assign = described_class.new(var_tuple, call_to_my_function)

      error_message = 'Wrong number of arguments in assignment: expected 2, got 3'
      expect { assign.evaluate context }.to raise_error(Gobstones::Runner::WrongArgumentsError, error_message)
    end

    it 'fails if the expression on the right is not a function call' do
      var_tuple = VarTuple.new([a, b])
      assign = described_class.new(var_tuple, Add.new(12.to_gbs_num, 23.to_gbs_num))

      error_message = 'expected a function call in multiple assignment'
      expect { assign.evaluate context }.to raise_error(Gobstones::Runner::GobstonesTypeError, error_message)
    end
  end
end
