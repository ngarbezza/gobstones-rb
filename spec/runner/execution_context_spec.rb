describe ExecutionContext do

  let(:context) { ExecutionContext.new }

  describe "variables context" do

    let(:negro) { Negro.new }
    let(:norte) { Norte.new }

    it "should allow to set & get a variable" do
      context.set 'myColor', negro

      expect(context.get('myColor')).to eq(negro)
    end

    it "should allow to set/get more than one variable" do
      context.set 'dir', norte
      context.set 'bool', true.to_gbs_bool

      expect(context.get('dir')).to eq(norte)
      expect(context.get('bool')).to eq(true.to_gbs_bool)
    end

    it "should raise an error when getting an undefined variable" do
      expect {
        context.get('undefined')
      }.to raise_error(UndefinedVariableError)
    end

  end

  describe ProgramExecutionContext do

    let(:context) { ProgramExecutionContext.for program }
    let(:program) { Program.new [], nil }

    it "should return self as program_context" do
      expect(context.program_context).to eq(context)
    end

    it "should have a head" do
      expect(context.head).to be_a Head
    end

    it "should have a board" do
      expect(context.board).to be_a Board
    end

  end

  describe ProcedureExecutionContext do

    it "should return the program_context in which it is based" do
      program = Program.new [], nil
      program_context = ProgramExecutionContext.for program
      procedure_context = ProcedureExecutionContext.based_on program_context

      expect(procedure_context.program_context).to eq(program_context)
    end

  end

end

