describe Gobstones::Parser, "command blocks" do

  it "parses an empty block" do
    expect('{}').to be_parsed_as(:command).and_return(CommandBlock.empty)
    expect('{     }').to be_parsed_as(:command).and_return(CommandBlock.empty)
  end

  it "parses a block with one simple cmd" do
    cmd_block = CommandBlock.new [Skip.new]
    expect('{ Skip }').to be_parsed_as(:command).and_return(cmd_block)
  end

  it "parses a block with many simple commands" do
    first = Poner.new verde
    second = Boom.new "error"
    third = Mover.new oeste
    cmd_block = CommandBlock.new [first, second, third]

    expect('{
      Poner(Verde)
      BOOM("error")
      Mover(Oeste)
     }').to be_parsed_as(:command).and_return(cmd_block)
  end

  it "allows semicolon between commands" do
    first = Poner.new verde
    second = Boom.new 'error'
    third = Mover.new oeste
    cmd_block = CommandBlock.new [first, second, third]

    expect('{Poner(Verde); BOOM("error");
      Mover(Oeste);
     }').to be_parsed_as(:command).and_return(cmd_block)
  end

  it "parses a block with simple and complex commands" do
    first = ProcedureCall.new 'Proc', []
    second = IfCmd.new true_value, empty_body
    cmd_block = CommandBlock.new [first, second]

    expect('{
      Proc()
      if (True) {}
     }').to be_parsed_as(:command).and_return(cmd_block)
  end

end
