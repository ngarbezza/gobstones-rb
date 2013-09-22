describe Gobstones::Parser, "main definition" do

  it "should parse a valid Main definition without return nor commands" do
    main = Main.new CmdBlock.new([]), NoReturnStatement.new

    'procedure Main() {}'.should be_parsed_as(:definition).and_fail
    'procedure Main() {}'.should be_parsed_as(:main).and_return(main)
  end

  it "should parse a valid main procedure with a return of var names" do
    return_tuple = VarTuple.new [VarName.new('x'), VarName.new('y')]
    main = Main.new CmdBlock.new([]), ReturnFromMain.new(return_tuple)

    'procedure Main() { return (x, y); }'.
      should be_parsed_as(:main).and_return(main)
  end

  it "should parse a valid main procedure with commands and return" do
    return_tuple = VarTuple.new [VarName.new('x'), VarName.new('y')]
    cmd_block = CmdBlock.new [Mover.new(Oeste.new), Skip.new]
    main = Main.new cmd_block, ReturnFromMain.new(return_tuple)

    'procedure Main() {
       Mover(Oeste)
       Skip
       return (x, y)
    }'.should be_parsed_as(:main).and_return(main)
  end

  it "should not parse a main procedure with an invalid identifier" do
    'procedure NotMain() {}'.should be_parsed_as(:main).and_fail
  end

  it "should not parse a main procedure with a return of expressions" do
    'procedure Main() { return (3+4) }'.should be_parsed_as(:main).and_fail
  end

  it "should not parse a main procedure with args" do
    'procedure Main(arg1, arg2) {}'.should be_parsed_as(:main).and_fail
  end

end