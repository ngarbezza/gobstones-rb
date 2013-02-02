describe Gobstones::Parser, "main definition" do

  it "should parse a valid Main definition without return nor commands" do
    proc_def = Procedure.new 'Main', VarTuple.new([]), CmdBlock.new([])
    main = Main.new CmdBlock.new([]), NoReturn.new

    'procedure Main() {}'.should_not be_parsed_to proc_def
    'procedure Main() {}'.should be_parsed_as_main_def_to main
  end

  it "should parse a valid main procedure with a return of var names" do
    return_tuple = VarTuple.new [VarName.new('x'), VarName.new('y')]
    main = Main.new CmdBlock.new([]), ReturnFromMain.new(return_tuple)

    'procedure Main() { return (x, y); }'.should be_parsed_as_main_def_to main
  end

  it "should parse a valid main procedure with commands and return" do
    return_tuple = VarTuple.new [VarName.new('x'), VarName.new('y')]
    cmd_block = CmdBlock.new [Mover.new(Oeste.new), Skip.new]
    main = Main.new cmd_block, ReturnFromMain.new(return_tuple)

    'procedure Main() {
       Mover(Oeste)
       Skip
       return (x, y)
    }'.should be_parsed_as_main_def_to main
  end

  it "should not parse a main procedure with an invalid identifier" do
    main = Main.new CmdBlock.new([]), NoReturn.new

    'procedure NotMain() {}'.should_not be_parsed_to main
  end

  it "should not parse a main procedure with a return of expressions" do
    pending "create matcher fail_to_parse or something like that"
  end

  it "should not parse a main procedure with args" do
    pending "create matcher fail_to_parse or something like that"
  end

end
