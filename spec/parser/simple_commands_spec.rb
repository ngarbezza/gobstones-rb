require 'gobstones/lang/commands/ir_al_origen_cmd'
require 'gobstones/lang/commands/vaciar_tablero_cmd'

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

    ['Poner', 'Sacar', 'Mover'].each do |command|

      describe "#{command}() cmd" do

        it "should be parsed ok with a primitive as argument" do
          cmd = Kernel.const_get(command).new Verde.new
          "#{command}(Verde)".should be_parsed_to(cmd)
          "#{command} (Verde)".should be_parsed_to(cmd)
          "#{command}( Verde )".should be_parsed_to(cmd)
        end

        it "should be parsed ok with a simple expression as argument" do
          cmd = Kernel.const_get(command).new MinColor.new
          "#{command}(minColor())".should be_parsed_to(cmd)
        end

        it "should be parsed ok with a complex expression as argument" do
          func_call = FuncCall.new 'funcCall', [Norte.new, Number.new(42)]
          cmd = Kernel.const_get(command).new Opuesto.new(func_call)
          "#{command}(opuesto(funcCall(Norte, 42)))".should be_parsed_to(cmd)
        end

      end

    end

    it "should parse a IrAlOrigen cmd" do
      ir_al_origen_cmd = IrAlOrigen.new
      'IrAlOrigen()'.should be_parsed_to(ir_al_origen_cmd)
    end

    it "should parse a VaciarTablero cmd" do
      vaciar_tablero_cmd = VaciarTablero.new
      'VaciarTablero()'.should be_parsed_to(vaciar_tablero_cmd)
    end

  end

end
