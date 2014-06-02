describe ExecutionContext do

  let(:program) { Program.new [], nil }
  let(:context) { ProgramExecutionContext.for program }

  describe "variables context" do

    let(:negro) { Negro.new }
    let(:norte) { Norte.new }

    it "allows to set/get a variable" do
      context.set 'myColor', negro

      expect(context.get('myColor')).to eq(negro)
    end

    it "allows to set/get more than one variable" do
      context.set 'dir', norte
      context.set 'bool', true.to_gbs_bool

      expect(context.get('dir')).to eq(norte)
      expect(context.get('bool')).to eq(true.to_gbs_bool)
    end

    it "raises an error when trying to get an undefined variable" do
      expect { context.get('undefined') }.to raise_error(UndefinedVariableError)
    end

  end

  describe ProgramExecutionContext do

    it "is the program context itself" do
      expect(context.program_context).to eq(context)
    end

    it "has a head" do
      expect(context.head).to be_a Head
    end

    it "has a board" do
      expect(context.board).to be_a Board
    end

  end

  describe ProcedureExecutionContext do

    let(:procedure_context) { ProcedureExecutionContext.based_on context }

    it "returns the program context in which it is based" do
      expect(procedure_context.program_context).to eq(context)
    end

    it "shares the head with the outer context" do
      expect(procedure_context.head).to eq(context.head)
    end

  end

  describe FunctionExecutionContext do

    let(:azul) { Azul.new }
    let(:verde) { Verde.new }

    it "returns the program context in which it is based" do
      function_context = FunctionExecutionContext.based_on context
      expect(function_context.program_context).to eq(context)
    end

    it "has a new head, a copy of the outer context's head" do
      context.head.put azul
      function_context = FunctionExecutionContext.based_on context
      function_context.head.put verde

      expect(function_context.head).not_to eq(context.head)
      expect(context.head.are_there_balls?(azul)).to be true
      expect(function_context.head.are_there_balls?(azul)).to be true
      expect(context.head.are_there_balls?(verde)).to be false
      expect(function_context.head.are_there_balls?(verde)).to be true
    end

  end

end
