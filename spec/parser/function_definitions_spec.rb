describe Gobstones::Parser, "function definitions" do

  it "should parse a function without args and a single return" do
    args = VarTuple.new []
    func_return = ReturnFromFunction.new [Number.new(42)]

    func_def = Function.new 'just42', args, CmdBlock.new([]), func_return

    'function just42() { return (42) }'.should be_parsed_to func_def
  end

  it "should parse a function with some args" do
    first_arg = VarName.new 'firstArg'
    second_arg = VarName.new 'secondArg'
    third_arg = VarName.new 'thirdArg'
    args = VarTuple.new [first_arg, second_arg, third_arg]
    body =
    return_st = ReturnFromFunction.new [Verde.new, PuedeMover.new(Norte.new)]
    func_def = Function.new 'myCoolFunction', args, CmdBlock.new([]), return_st

    'function myCoolFunction (firstArg, secondArg, thirdArg) {
  return (Verde, puedeMover(Norte))
}'.should be_parsed_to func_def
  end

  it "should parse a function with some statements" do
    args = VarTuple.new [VarName.new('arg')]
    body = CmdBlock.new [Poner.new(Verde.new)]
    return_st = ReturnFromFunction.new [True.new]
    func_def = Function.new 'myFunc', args, body, return_st

    'function myFunc(arg)
{
  Poner(Verde)
  return (True)
}'.should be_parsed_to func_def
  end

  it "should not parse a function without a valid identifier" do
    args = VarTuple.new []
    body = CmdBlock.new []
    return_st = ReturnFromFunction.new [True.new]
    func_def = Function.new 'MyWrongFunc', args, body, return_st

    'function MyWrongFunc() { return(True) }'.should_not be_parsed_to func_def
  end

  it "should not parse a function without a return statement" do
    args = VarTuple.new []
    body = CmdBlock.new []
    return_st = ReturnFromFunction.new []
    func_def = Function.new 'myFuncWithoutReturn', args, body, return_st

    'function myFuncWithoutReturn() { }'.should_not be_parsed_to func_def
  end

end
