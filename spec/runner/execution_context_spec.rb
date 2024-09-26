# frozen_string_literal: true

RSpec.describe ExecutionContext do
  let(:context) { clean_context }

  describe 'variables context' do
    it 'allows to set/get a variable' do
      context.set 'myColor', negro

      expect(context.get('myColor')).to eq(negro)
    end

    it 'allows to set/get more than one variable' do
      context.set 'dir', norte
      context.set 'bool', true_value

      expect(context.get('dir')).to eq(norte)
      expect(context.get('bool')).to eq(true_value)
    end

    it 'raises an error when trying to get an undefined variable' do
      expect { context.get('undefined') }.to raise_error(UndefinedVariableError)
    end
  end

  describe ProgramExecutionContext do
    it 'is the program context itself' do
      expect(context.program_context).to eq(context)
    end
  end

  describe ProcedureExecutionContext do
    let(:procedure_context) { described_class.based_on(context) }

    it 'returns the program context in which it is based and shares the head with the outer context' do
      expect(procedure_context.program_context).to eq(context)
      expect(procedure_context.head).to eq(context.head)
    end
  end

  describe FunctionExecutionContext do
    it 'returns the program context in which it is based' do
      function_context = described_class.based_on(context)

      expect(function_context.program_context).to eq(context)
    end

    it "has a new head, a copy of the outer context's head" do
      context.head.put(azul)
      function_context = described_class.based_on(context)
      function_context.head.put(verde)

      expect(function_context.head).not_to eq(context.head)
      expect_balls(azul)
      expect_no_balls(verde)
      expect_balls(azul, on: function_context.head)
      expect_balls(verde, on: function_context.head)
    end
  end
end
