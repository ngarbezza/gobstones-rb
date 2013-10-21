describe Gobstones::Parser, "primitive expressions" do

  describe "variable identifiers" do

    it "should parse valid var names" do
      expect('v').to be_parsed_as(:expression).and_return(VarName.new('v'))
      expect('var1').to be_parsed_as(:expression).and_return(VarName.new('var1'))
      expect('a_var').to be_parsed_as(:expression).and_return(VarName.new('a_var'))
      expect('vAR').to be_parsed_as(:expression).and_return(VarName.new('vAR'))
    end

    it "should not parse invalid var names" do
      expect('1').not_to be_parsed_as(:expression).and_return(VarName.new('1'))
      expect('_var').to be_parsed_as(:expression).and_fail
      expect('Var').to be_parsed_as(:expression).and_fail
    end

    it "should not parse reserved words as var names" do
      literals = %w{True False Rojo Negro Azul Verde Norte Oeste Este Sur}
      (RESERVED_IDS - literals).each do |id|
        expect(id).to be_parsed_as(:expression).and_fail
      end
    end

  end

  describe "type bounds functions" do

    it "should parse the minBool() function" do
      expect('minBool()').to be_parsed_as(:expression).and_return(MinBool.new)
    end

    it "should parse the maxBool() function" do
      expect('maxBool()').to be_parsed_as(:expression).and_return(MaxBool.new)
    end

    it "should parse the minColor() function" do
      expect('minColor()').to be_parsed_as(:expression).and_return(MinColor.new)
    end

    it "should parse the maxColor() function" do
      expect('maxColor()').to be_parsed_as(:expression).and_return(MaxColor.new)
    end

    it "should parse the minDir() function" do
      expect('minDir()').to be_parsed_as(:expression).and_return(MinDir.new)
    end

    it "should parse the maxDir() function" do
      expect('maxDir()').to be_parsed_as(:expression).and_return(MaxDir.new)
    end

  end

  describe "other type functions" do

    it "should parse the siguiente() function " do
      arg = VarName.new 'x'
      func = Siguiente.new arg
      expect('siguiente(x)').to be_parsed_as(:expression).and_return(func)
      expect('siguiente(x    )').to be_parsed_as(:expression).and_return(func)
    end

    it "should parse the previo() function" do
      arg = VarName.new 'y'
      func = Previo.new arg
      expect('previo(y)').to be_parsed_as(:expression).and_return(func)
      expect('previo(   y )').to be_parsed_as(:expression).and_return(func)
    end

    it "should parse the opuesto() function" do
      arg = VarName.new 'z'
      func = Opuesto.new arg
      expect('opuesto(z)').to be_parsed_as(:expression).and_return(func)
      expect('opuesto(   z )').to be_parsed_as(:expression).and_return(func)
    end

  end

  describe "board primitive functions" do

    it "should parse the nroBolitas(exp) function" do
      arg = VarName.new 'color'
      func = NroBolitas.new arg
      expect('nroBolitas(color)').to be_parsed_as(:expression).and_return(func)
      expect('nroBolitas( color  )').to be_parsed_as(:expression).and_return(func)
    end

    it "should parse the hayBolitas(exp) function" do
      arg = VarName.new 'color'
      func = HayBolitas.new arg
      expect('hayBolitas(color)').to be_parsed_as(:expression).and_return(func)
      expect('hayBolitas(  color )').to be_parsed_as(:expression).and_return(func)
    end

    it "should parse the puedeMover(exp) function" do
      arg = VarName.new 'dir'
      func = PuedeMover.new arg
      expect('puedeMover(dir)').to be_parsed_as(:expression).and_return(func)
      expect('puedeMover(  dir  )').to be_parsed_as(:expression).and_return(func)
    end

  end

end