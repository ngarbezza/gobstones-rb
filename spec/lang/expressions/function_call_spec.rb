describe FunctionCall do

  let(:my_function) { Function.new('myFunction', args, empty_body, return_statement) }
  let(:program) { Program.new([my_function], no_return_statement) }
  let(:context) { program_context_for(program) }
  let(:call) { FunctionCall.new('myFunction', calling_arguments) }

  context 'without arguments' do

    let(:args) { no_arguments }
    let(:return_statement) { ReturnFromFunction.new([42.to_gbs_num]) }
    let(:calling_arguments) { [] }

    it 'evaluates an existing function and returns its result when calling it' do
      result = call.evaluate(context)

      expect(result).to eq(42.to_gbs_num)
    end

  end

  context 'with arguments' do

    let(:number_a) { 'a'.to_var_name }
    let(:number_b) { 'b'.to_var_name }
    let(:number_c) { 'c'.to_var_name }
    let(:args) { VarTuple.new([number_a, number_b, number_c]) }
    let(:return_statement) { ReturnFromFunction.new([Add.new(Add.new(number_a, number_b), number_c)]) }
    let(:calling_arguments) { [1.to_gbs_num, 2.to_gbs_num, 3.to_gbs_num] }

    it 'evaluates an existing function with some arguments' do
      result = call.evaluate(context)

      expect(result).to eq(6.to_gbs_num)
    end

  end
end
