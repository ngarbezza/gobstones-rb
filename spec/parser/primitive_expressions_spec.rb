RSpec.describe Gobstones::Parser, 'primitive expressions' do
  describe 'variable identifiers' do
    it 'parses valid var names' do
      expect('v').to be_parsed_as(:expression).and_return('v'.to_var_name)
      expect('var1').to be_parsed_as(:expression).and_return('var1'.to_var_name)
      expect('a_var').to be_parsed_as(:expression).and_return('a_var'.to_var_name)
      expect('vAR').to be_parsed_as(:expression).and_return('vAR'.to_var_name)
    end

    it 'does not parse invalid var names' do
      expect('1').not_to be_parsed_as(:expression).and_return('1'.to_var_name)
      expect('_var').to be_parsed_as(:expression).and_fail
      expect('Var').to be_parsed_as(:expression).and_fail
    end

    it 'does not parse reserved words as var names' do
      literals = %w[True False Rojo Negro Azul Verde Norte Oeste Este Sur]

      expect(RESERVED_IDS - literals).to all(be_parsed_as(:expression).and_fail)
    end
  end

  describe 'type bounds functions' do
    it 'parses the minBool() function' do
      expect('minBool()').to be_parsed_as(:expression).and_return(MinBool.new)
    end

    it 'parses the maxBool() function' do
      expect('maxBool()').to be_parsed_as(:expression).and_return(MaxBool.new)
    end

    it 'parses the minColor() function' do
      expect('minColor()').to be_parsed_as(:expression).and_return(MinColor.new)
    end

    it 'parses the maxColor() function' do
      expect('maxColor()').to be_parsed_as(:expression).and_return(MaxColor.new)
    end

    it 'parses the minDir() function' do
      expect('minDir()').to be_parsed_as(:expression).and_return(MinDir.new)
    end

    it 'parses the maxDir() function' do
      expect('maxDir()').to be_parsed_as(:expression).and_return(MaxDir.new)
    end
  end

  describe 'other type functions' do
    it 'parses the siguiente() function ' do
      func = Siguiente.new('x'.to_var_name)

      expect('siguiente(x)').to be_parsed_as(:expression).and_return(func)
      expect('siguiente(x    )').to be_parsed_as(:expression).and_return(func)
    end

    it 'parses the previo() function' do
      func = Previo.new('y'.to_var_name)

      expect('previo(y)').to be_parsed_as(:expression).and_return(func)
      expect('previo(   y )').to be_parsed_as(:expression).and_return(func)
    end

    it 'parses the opuesto() function' do
      func = Opuesto.new('z'.to_var_name)

      expect('opuesto(z)').to be_parsed_as(:expression).and_return(func)
      expect('opuesto(   z )').to be_parsed_as(:expression).and_return(func)
    end
  end

  describe 'board primitive functions' do
    it 'parses the nroBolitas(exp) function' do
      func = NroBolitas.new('color'.to_var_name)

      expect('nroBolitas(color)').to be_parsed_as(:expression).and_return(func)
      expect('nroBolitas( color  )').to be_parsed_as(:expression).and_return(func)
    end

    it 'parses the hayBolitas(exp) function' do
      func = HayBolitas.new('color'.to_var_name)

      expect('hayBolitas(color)').to be_parsed_as(:expression).and_return(func)
      expect('hayBolitas(  color )').to be_parsed_as(:expression).and_return(func)
    end

    it 'parses the puedeMover(exp) function' do
      func = PuedeMover.new('dir'.to_var_name)

      expect('puedeMover(dir)').to be_parsed_as(:expression).and_return(func)
      expect('puedeMover(  dir  )').to be_parsed_as(:expression).and_return(func)
    end
  end
end
