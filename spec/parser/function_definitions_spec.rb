describe Gobstones::Parser, 'function definitions' do

  it 'parses a function without args and a single return' do
    func_return = ReturnFromFunction.new([42.to_gbs_num])
    func_def = Function.new('just42', no_arguments, empty_body, func_return)

    expect('function just42() { return (42) }').
      to be_parsed_as(:definition).and_return(func_def)
  end

  it 'parses a function with some args' do
    args = VarTuple.new(['firstArg'.to_var_name, 'secondArg'.to_var_name, 'thirdArg'.to_var_name])
    return_st = ReturnFromFunction.new([verde, PuedeMover.new(norte)])
    func_def = Function.new('myCoolFunction', args, empty_body, return_st)

    expect('function myCoolFunction (firstArg, secondArg, thirdArg) {
  return (Verde, puedeMover(Norte))
}').to be_parsed_as(:definition).and_return(func_def)
  end

  it 'parses a function with some statements' do
    args = VarTuple.new(['arg'.to_var_name])
    body = CommandBlock.new([Poner.new(verde)])
    return_st = ReturnFromFunction.new([true_value])
    func_def = Function.new('myFunc', args, body, return_st)

    expect('function myFunc(arg)
{
  Poner(Verde)
  return (True)
}').to be_parsed_as(:definition).and_return(func_def)
  end

  it 'does not parse a function without a valid identifier' do
    expect('function MyWrongFunc() { return(True) }').to be_parsed_as(:definition).and_fail
  end

  it 'does not parse a function without a return statement' do
    expect('function myFuncWithoutReturn() { }').to be_parsed_as(:definition).and_fail
  end

end
