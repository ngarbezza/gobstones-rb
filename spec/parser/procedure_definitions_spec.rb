describe Gobstones::Parser, "procedure definitions" do

  let(:body) { CommandBlock.empty }

  it "should parse an empty procedure def without args" do
    args = VarTuple.empty
    proc_def = Procedure.new 'MyProc', args, body

    expect('procedure MyProc() {}').
      to be_parsed_as(:definition).and_return(proc_def)
  end

  it "should parse an empty procedure with some args" do
    first_arg = VarName.new 'firstArg'
    second_arg = VarName.new 'secondArg'
    third_arg = VarName.new 'thirdArg'
    args = VarTuple.new [first_arg, second_arg, third_arg]
    proc_def = Procedure.new 'MyProc', args, body

    expect('procedure MyProc (firstArg, secondArg, thirdArg) {}').
      to be_parsed_as(:definition).and_return(proc_def)
  end

  it "should parse a procedure with some statements" do
    args = VarTuple.new [VarName.new('arg')]
    body = CommandBlock.new [Poner.new(verde)]
    proc_def = Procedure.new 'MyProc', args, body

    expect('procedure MyProc(arg)
{
  Poner(Verde)
}').to be_parsed_as(:definition).and_return(proc_def)
  end

  it "should not parse a procedure without a valid identifier" do
    expect('procedure myWrongProc() {}').to be_parsed_as(:definition).and_fail
  end

end
