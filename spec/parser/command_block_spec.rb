require 'gobstones/lang/commands/command_block'
require 'gobstones/lang/commands/skip_cmd'
require 'gobstones/lang/commands/poner_cmd'
require 'gobstones/lang/commands/boom_cmd'
require 'gobstones/lang/commands/mover_cmd'

describe Gobstones::Parser, "command blocks" do

  it "should parse an empty block" do
    cmd_block = CmdBlock.new []

    '{}'.should be_parsed_to cmd_block
    '{     }'.should be_parsed_to cmd_block
  end

  it "should parse a block with one simple cmd" do
    cmd_block = CmdBlock.new [Skip.new]
    '{ Skip }'.should be_parsed_to cmd_block
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
     }'.should be_parsed_to cmd_block
  end

  it "should allow ; between cmds" do
    first = Poner.new Verde.new
    second = Boom.new "error"
    third = Mover.new Oeste.new
    cmd_block = CmdBlock.new [first, second, third]

    '{Poner(Verde); BOOM("error");
      Mover(Oeste);
     }'.should be_parsed_to cmd_block
  end

  it "should parse a block with simple and complex cmds" do
    pending
  end

end
