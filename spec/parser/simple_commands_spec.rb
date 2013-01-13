require 'gobstones/lang/commands/skip_cmd'
require 'gobstones/lang/commands/boom_cmd'
require 'gobstones/lang/commands/poner_cmd'

describe Gobstones::Parser, "simple commands" do

  describe "primitives" do

    it "should parse a Skip cmd" do
      skip_cmd = Skip.new
      'Skip'.should be_parsed_to(skip_cmd)
    end

    it "should parse a BOOM cmd" do
      boom_cmd = Boom.new 'the message'
      'BOOM("the message")'.should be_parsed_to(boom_cmd)
      'BOOM  ("the message")'.should be_parsed_to(boom_cmd)
      'BOOM(  "the message"  )'.should be_parsed_to(boom_cmd)
    end

    describe "Poner() cmd" do

      it "should be parsed ok with a color as argument" do
        poner_cmd = Poner.new Verde.new
        'Poner(Verde)'.should be_parsed_to(poner_cmd)
        'Poner (Verde)'.should be_parsed_to(poner_cmd)
        'Poner( Verde )'.should be_parsed_to(poner_cmd)
      end

      it "should be parsed ok with a simple expression as argument" do
        poner_cmd = Poner.new Azul.new
        'Poner(minColor())'.should be_parsed_to(poner_cmd)
      end

      it "should be parsed ok with a complex expression as argument" do
        func_call = FuncCall.new 'funcCall', [Norte.new, Number.new(42)]
        poner_cmd = Poner.new Opuesto.new(func_call)
        'Poner(opuesto(funcCall(Norte, 42)))'.should be_parsed_to(poner_cmd)
      end

    end

  end

end
