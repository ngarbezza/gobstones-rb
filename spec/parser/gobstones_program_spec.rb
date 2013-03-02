describe Gobstones::Parser, "program definitions" do

  it "should parse a simple program with a single main" do
    main_def = Main.new CmdBlock.new([]), NoReturn.new
    program = Program.new [], main_def

    'procedure Main(){}'.should be_parsed_as(:program).and_return(program)
  end

  it "should parse a program with Main and procedures" do
    main_def = Main.new CmdBlock.new([]), NoReturn.new
    proc_1 = Procedure.new 'Procedure1', VarTuple.new([]), CmdBlock.new([])
    proc_2 = Procedure.new 'Procedure2', VarTuple.new([]), CmdBlock.new([])
    program = Program.new [proc_1, proc_2], main_def

    gbs_code = <<GBS
procedure Procedure1(){ }

procedure Procedure2 () {}

procedure Main() {}
GBS
    gbs_code.should be_parsed_as(:program).and_return(program)
  end

  it "should parse a program with Main, procedures and functions" do
    main_def = Main.new CmdBlock.new([]), NoReturn.new
    proc_1 = Procedure.new 'Procedure1', VarTuple.new([]), CmdBlock.new([])
    func_1 = Function.new 'function1', VarTuple.new([]), CmdBlock.new([]), ReturnFromFunction.new([42.to_gbs_num])
    proc_2 = Procedure.new 'Procedure2', VarTuple.new([]), CmdBlock.new([])
    program = Program.new [proc_1, func_1, proc_2], main_def
    gbs_code = <<GBS
procedure Procedure1(){ }

function function1() { return (42) }

procedure Procedure2 () {}

procedure Main() {}
GBS
    gbs_code.should be_parsed_as(:program).and_return(program)
  end

  it "should not parse a program without a Main definition" do
    'procedure Procedure1(){}
    procedure Procedure2() {}'.should be_parsed_as(:program).and_fail
  end

  it "should not parse a program if Main is not the last definition" do
    'procedure Procedure1() {}
    procedure Main() {}
    procedure Procedure2() {}'.should be_parsed_as(:program).and_fail
  end

end
