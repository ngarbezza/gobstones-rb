RSpec.describe Gobstones::Parser, 'procedure definitions' do
  it 'parses an empty procedure def without args' do
    proc_def = Procedure.new('MyProc', no_arguments, empty_body)

    expect('procedure MyProc() {}').to be_parsed_as(:definition).and_return(proc_def)
  end

  it 'parses an empty procedure with some args' do
    args = VarTuple.with_names(%w[firstArg secondArg thirdArg])
    proc_def = Procedure.new('MyProc', args, empty_body)

    expect('procedure MyProc (firstArg, secondArg, thirdArg) {}').
      to be_parsed_as(:definition).and_return(proc_def)
  end

  it 'parses a procedure with some statements' do
    args = VarTuple.with_names(%w[arg])
    body = CommandBlock.with_just(Poner.new(verde))
    proc_def = Procedure.new('MyProc', args, body)

    expect('procedure MyProc(arg)
{
  Poner(Verde)
}').to be_parsed_as(:definition).and_return(proc_def)
  end

  it 'does not parse a procedure without a valid identifier' do
    expect('procedure myWrongProc() {}').to be_parsed_as(:definition).and_fail
  end
end
