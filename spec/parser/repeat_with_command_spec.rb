describe Gobstones::Parser, 'repeatWith statements' do
  it 'parses an empty statement' do
    min_range = 1.to_gbs_num
    max_range = 10.to_gbs_num
    rw_cmd = RepeatWith.new('i'.to_var_name, min_range, max_range, empty_body)

    expect('repeatWith i in 1..10 {}').to be_parsed_as(:command).and_return(rw_cmd)
  end

  it 'parses an statement with any expressions in the range' do
    min_range = MinDir.new
    max_range = Siguiente.new(rojo)
    cmd_block = CommandBlock.new([Poner.new(verde)])
    rw_cmd = RepeatWith.new('myDir'.to_var_name, min_range, max_range, cmd_block)

    expect('repeatWith myDir in minDir() .. siguiente(Rojo) {
      Poner(Verde)
    }').to be_parsed_as(:command).and_return(rw_cmd)
  end
end
