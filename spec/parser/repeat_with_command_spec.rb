describe Gobstones::Parser, "repeatWith statements" do

  it "should parse an empty statement" do
    var_name = VarName.new 'i'
    min_range, max_range = Number.new(1), Number.new(10)
    cmd_block = CmdBlock.new []
    rw_cmd = RepeatWithCmd.new var_name, min_range, max_range, cmd_block

    'repeatWith i in 1..10 {}'.should be_parsed_to rw_cmd
  end

  it "should parse an statement with any expressions in the range" do
    var_name = VarName.new 'myDir'
    min_range, max_range = MinDir.new, Siguiente.new(Rojo.new)
    cmd_block = CmdBlock.new [Poner.new(Verde.new)]
    rw_cmd = RepeatWithCmd.new var_name, min_range, max_range, cmd_block

    'repeatWith myDir in minDir() .. siguiente(Rojo) {
      Poner(Verde)
    }'.should be_parsed_to rw_cmd
  end

end