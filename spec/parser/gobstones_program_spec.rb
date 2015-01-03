describe Gobstones::Parser, "program definitions" do

  it "parses a simple program with a single main" do
    main_def = Main.new CommandBlock.empty, no_return_statement
    program = Program.new [], main_def

    expect('procedure Main(){}').to be_parsed_as(:program).and_return(program)
  end

  it "parses a program with Main and procedures" do
    main_def = Main.new CommandBlock.empty, no_return_statement
    proc_1 = Procedure.new 'Procedure1', no_arguments, CommandBlock.empty
    proc_2 = Procedure.new 'Procedure2', no_arguments, CommandBlock.empty
    program = Program.new [proc_1, proc_2], main_def

    gbs_code = <<GBS
procedure Procedure1(){ }

procedure Procedure2 () {}

procedure Main() {}
GBS
    expect(gbs_code).to be_parsed_as(:program).and_return(program)
  end

  it "parses a program with Main, procedures and functions" do
    main_def = Main.new CommandBlock.new([]), NoReturnStatement.new
    proc_1 = Procedure.new 'Procedure1', no_arguments, CommandBlock.empty
    func_1 = Function.new 'function1', no_arguments, CommandBlock.empty, ReturnFromFunction.new([42.to_gbs_num])
    proc_2 = Procedure.new 'Procedure2', no_arguments, CommandBlock.empty
    program = Program.new [proc_1, func_1, proc_2], main_def
    gbs_code = <<GBS
procedure Procedure1(){ }

function function1() { return (42) }

procedure Procedure2 () {}

procedure Main() {}
GBS
    expect(gbs_code).to be_parsed_as(:program).and_return(program)
  end

  it "does not parse a program without a Main definition" do
    expect('procedure Procedure1(){}
    procedure Procedure2() {}').to be_parsed_as(:program).and_fail
  end

  it "does not parse a program if Main is not the last definition" do
    expect('procedure Procedure1() {}
    procedure Main() {}
    procedure Procedure2() {}').to be_parsed_as(:program).and_fail
  end

end
