describe Gobstones::Parser, "function definitions" do

  it "should parse a function without args and a single return" do
    func_return = ReturnFromFunction.new [42.to_gbs_num]

    func_def = Function.new 'just42', no_arguments, CmdBlock.empty, func_return

    expect('function just42() { return (42) }').
      to be_parsed_as(:definition).and_return(func_def)
  end

  it "should parse a function with some args" do
    first_arg = VarName.new 'firstArg'
    second_arg = VarName.new 'secondArg'
    third_arg = VarName.new 'thirdArg'
    args = VarTuple.new [first_arg, second_arg, third_arg]
    return_st = ReturnFromFunction.new [verde, PuedeMover.new(Norte.new)]
    func_def = Function.new 'myCoolFunction', args, CmdBlock.empty, return_st

    expect('function myCoolFunction (firstArg, secondArg, thirdArg) {
  return (Verde, puedeMover(Norte))
}').to be_parsed_as(:definition).and_return(func_def)
  end

  it "should parse a function with some statements" do
    args = VarTuple.new [VarName.new('arg')]
    body = CmdBlock.new [Poner.new(verde)]
    return_st = ReturnFromFunction.new [true_value]
    func_def = Function.new 'myFunc', args, body, return_st

    expect('function myFunc(arg)
{
  Poner(Verde)
  return (True)
}').to be_parsed_as(:definition).and_return(func_def)
  end

  it "should not parse a function without a valid identifier" do
    expect('function MyWrongFunc() { return(True) }').
      to be_parsed_as(:definition).and_fail
  end

  it "should not parse a function without a return statement" do
    expect('function myFuncWithoutReturn() { }').
      to be_parsed_as(:definition).and_fail
  end

end
