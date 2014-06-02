describe Gobstones::Parser, "command blocks" do

  it "should parse an empty block" do
    cmd_block = CmdBlock.empty

    expect('{}').to be_parsed_as(:command).and_return(cmd_block)
    expect('{     }').to be_parsed_as(:command).and_return(cmd_block)
  end

  it "should parse a block with one simple cmd" do
    cmd_block = CmdBlock.new [Skip.new]
    expect('{ Skip }').to be_parsed_as(:command).and_return(cmd_block)
  end

  it "should parse a block with many simple commands" do
    first = Poner.new verde
    second = Boom.new "error"
    third = Mover.new Oeste.new
    cmd_block = CmdBlock.new [first, second, third]

    expect('{
      Poner(Verde)
      BOOM("error")
      Mover(Oeste)
     }').to be_parsed_as(:command).and_return(cmd_block)
  end

  it "should allow ; between commands" do
    first = Poner.new verde
    second = Boom.new "error"
    third = Mover.new Oeste.new
    cmd_block = CmdBlock.new [first, second, third]

    expect('{Poner(Verde); BOOM("error");
      Mover(Oeste);
     }').to be_parsed_as(:command).and_return(cmd_block)
  end

  it "should parse a block with simple and complex commands" do
    first = ProcedureCall.new 'Proc', []
    second = IfCmd.new true_value, CmdBlock.empty
    cmd_block = CmdBlock.new [first, second]

    expect('{
      Proc()
      if (True) {}
     }').to be_parsed_as(:command).and_return(cmd_block)
  end

end
