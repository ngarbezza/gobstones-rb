RSpec.describe Gobstones::Parser, 'main definition' do
  let(:return_tuple) { VarTuple.with_names(%w[x y]) }

  it 'parses a valid Main definition without return nor commands' do
    main = Main.new(empty_body, no_return_statement)

    expect('procedure Main() {}').to be_parsed_as(:definition).and_fail
    expect('procedure Main() {}').to be_parsed_as(:main).and_return(main)
  end

  it 'parses a valid main procedure with a return of var names' do
    main = Main.new(empty_body, ReturnFromMain.new(return_tuple))

    expect('procedure Main() { return (x, y); }').to be_parsed_as(:main).and_return(main)
  end

  it 'parses a valid main procedure with commands and return' do
    cmd_block = CommandBlock.new([Mover.new(oeste), Skip.new])
    main = Main.new(cmd_block, ReturnFromMain.new(return_tuple))

    expect('procedure Main() {
       Mover(Oeste)
       Skip
       return (x, y)
    }').to be_parsed_as(:main).and_return(main)
  end

  it 'does not parse a main procedure with an invalid identifier' do
    expect('procedure NotMain() {}').to be_parsed_as(:main).and_fail
  end

  it 'does not parse a main procedure with a return of expressions' do
    expect('procedure Main() { return (3+4) }').to be_parsed_as(:main).and_fail
  end

  it 'does not parse a main procedure with args' do
    expect('procedure Main(arg1, arg2) {}').to be_parsed_as(:main).and_fail
  end
end
