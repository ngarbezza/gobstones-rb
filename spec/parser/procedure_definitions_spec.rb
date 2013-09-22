describe Gobstones::Parser, "procedure definitions" do

  it "should parse an empty procedure def without args" do
    args = VarTuple.new []
    body = CmdBlock.new []
    proc_def = Procedure.new 'MyProc', args, body

    'procedure MyProc() {}'.
      should be_parsed_as(:definition).and_return(proc_def)
  end

  it "should parse an empty procedure with some args" do
    first_arg = VarName.new 'firstArg'
    second_arg = VarName.new 'secondArg'
    third_arg = VarName.new 'thirdArg'
    args = VarTuple.new [first_arg, second_arg, third_arg]
    body = CmdBlock.new []
    proc_def = Procedure.new 'MyProc', args, body

    'procedure MyProc (firstArg, secondArg, thirdArg) {}'.
      should be_parsed_as(:definition).and_return(proc_def)
  end

  it "should parse a procedure with some statements" do
    args = VarTuple.new [VarName.new('arg')]
    body = CmdBlock.new [Poner.new(Verde.new)]
    proc_def = Procedure.new 'MyProc', args, body

    'procedure MyProc(arg)
{
  Poner(Verde)
}'.should be_parsed_as(:definition).and_return(proc_def)
  end

  it "should not parse a procedure without a valid identifier" do
    'procedure myWrongProc() {}'.should be_parsed_as(:definition).and_fail
  end

end