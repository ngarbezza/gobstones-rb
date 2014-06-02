describe Gobstones::Parser, "repeatWith statements" do

  it "should parse an empty statement" do
    var_name = VarName.new 'i'
    min_range, max_range = 1.to_gbs_num, 10.to_gbs_num
    cmd_block = CmdBlock.empty
    rw_cmd = RepeatWithCmd.new var_name, min_range, max_range, cmd_block

    expect('repeatWith i in 1..10 {}').to be_parsed_as(:command).and_return(rw_cmd)
  end

  it "should parse an statement with any expressions in the range" do
    var_name = VarName.new 'myDir'
    min_range, max_range = MinDir.new, Siguiente.new(rojo)
    cmd_block = CmdBlock.new [Poner.new(verde)]
    rw_cmd = RepeatWithCmd.new var_name, min_range, max_range, cmd_block

    expect('repeatWith myDir in minDir() .. siguiente(Rojo) {
      Poner(Verde)
    }').to be_parsed_as(:command).and_return(rw_cmd)
  end

end
