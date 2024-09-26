# frozen_string_literal: true

RSpec.describe Gobstones::Parser, 'simple commands' do
  describe 'primitives' do
    it 'parses a Skip cmd' do
      expect('Skip').to be_parsed_as(:command).and_return(Skip.new)
    end

    it 'parses a BOOM cmd' do
      boom_cmd = Boom.new('the message')

      expect('BOOM("the message")').to be_parsed_as(:command).and_return(boom_cmd)
      expect('BOOM  ("the message")').to be_parsed_as(:command).and_return(boom_cmd)
      expect('BOOM( "the message" )').to be_parsed_as(:command).and_return(boom_cmd)
    end

    %w[Poner Sacar Mover].each do |command|
      describe "#{command}() cmd" do
        it 'is parsed ok with a primitive as argument' do
          cmd = Kernel.const_get(command).new(verde)

          expect("#{command}(Verde)").to be_parsed_as(:command).and_return(cmd)
          expect("#{command} (Verde)").to be_parsed_as(:command).and_return(cmd)
          expect("#{command}( Verde )").to be_parsed_as(:command).and_return(cmd)
        end

        it 'is parsed ok with a simple expression as argument' do
          cmd = Kernel.const_get(command).new(MinColor.new)

          expect("#{command}(minColor())").to be_parsed_as(:command).and_return(cmd)
        end

        it 'is parsed ok with a complex expression as argument' do
          func_call = FunctionCall.new('funcCall', [norte, 42.to_gbs_num])
          cmd = Kernel.const_get(command).new(Opuesto.new(func_call))

          expect("#{command}(opuesto(funcCall(Norte, 42)))").to be_parsed_as(:command).and_return(cmd)
        end
      end
    end

    it 'parses a IrAlOrigen cmd' do
      expect('IrAlOrigen()').to be_parsed_as(:command).and_return(IrAlOrigen.new)
    end

    it 'parses a VaciarTablero cmd' do
      expect('VaciarTablero()').to be_parsed_as(:command).and_return(VaciarTablero.new)
    end
  end
end
