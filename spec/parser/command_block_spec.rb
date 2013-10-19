describe Gobstones::Parser, "command blocks" do

  it "should parse an empty block" do
    cmd_block = CmdBlock.empty

    '{}'.should be_parsed_as(:command).and_return(cmd_block)
    '{     }'.should be_parsed_as(:command).and_return(cmd_block)
  end

  it "should parse a block with one simple cmd" do
    cmd_block = CmdBlock.new [Skip.new]
    '{ Skip }'.should be_parsed_as(:command).and_return(cmd_block)
  end

  it "should parse a block with many simple cmds" do
    first = Poner.new Verde.new
    second = Boom.new "error"
    third = Mover.new Oeste.new
    cmd_block = CmdBlock.new [first, second, third]

    '{
      Poner(Verde)
      BOOM("error")
      Mover(Oeste)
     }'.should be_parsed_as(:command).and_return(cmd_block)
  end

  it "should allow ; between cmds" do
    first = Poner.new Verde.new
    second = Boom.new "error"
    third = Mover.new Oeste.new
    cmd_block = CmdBlock.new [first, second, third]

    '{Poner(Verde); BOOM("error");
      Mover(Oeste);
     }'.should be_parsed_as(:command).and_return(cmd_block)
  end

  it "should parse a block with simple and complex cmds" do
    first = ProcedureCall.new 'Proc', []
    second = IfCmd.new True.new, CmdBlock.empty
    cmd_block = CmdBlock.new [first, second]

    '{
      Proc()
      if (True) {}
     }'.should be_parsed_as(:command).and_return(cmd_block)
  end

end