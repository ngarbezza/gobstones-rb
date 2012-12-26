describe Gobstones::Parser, "primitive expressions" do

  describe "variable identifiers" do

    it "should parse valid var names" do
      'v'.should be_parsed_to VarName.new('v')
      'var1'.should be_parsed_to VarName.new('var1')
      'a_var'.should be_parsed_to VarName.new('a_var')
      'vAR'.should be_parsed_to VarName.new('vAR')
    end

    it "should not parse invalid var names" do
      '1'.should_not be_parsed_to VarName.new('1')
      '_var'.should_not be_parsed_to VarName.new('_var')
      'Var'.should_not be_parsed_to VarName.new('Var')
    end

    it "should not parse reserved words as var names" do
      RESERVED_IDS.each do |id|
        id.should_not be_parsed_to VarName.new(id)
      end
    end

  end

  describe "type bounds functions" do

    it "should parse the minBool() function" do
      'minBool()'.should be_parsed_to False.new
    end

    it "should parse the maxBool() function" do
      'maxBool()'.should be_parsed_to True.new
    end

    it "should parse the minColor() function" do
      'minColor()'.should be_parsed_to Azul.new
    end

    it "should parse the maxColor() function" do
      'maxColor()'.should be_parsed_to Verde.new
    end

    it "should parse the minDir() function" do
      'minDir()'.should be_parsed_to Norte.new
    end

    it "should parse the maxDir() function" do
      'maxDir()'.should be_parsed_to Oeste.new
    end

  end

  describe "other type functions" do

    it "should parse the siguiente() function " do
      arg = VarName.new 'x'
      func = Siguiente.new arg
      'siguiente(x)'.should be_parsed_to(func)
      'siguiente(x    )'.should be_parsed_to(func)
    end

    it "should parse the previo() function" do
      arg = VarName.new 'y'
      func = Previo.new arg
      'previo(y)'.should be_parsed_to(func)
      'previo(   y )'.should be_parsed_to(func)
    end

    it "should parse the opuesto() function" do
      arg = VarName.new 'z'
      func = Opuesto.new arg
      'opuesto(z)'.should be_parsed_to(func)
      'opuesto(   z )'.should be_parsed_to(func)
    end

  end

  describe "board primitive functions" do

    it "should parse the nroBolitas(exp) function" do
      arg = VarName.new 'color'
      func = NroBolitas.new arg
      'nroBolitas(color)'.should be_parsed_to(func)
      'nroBolitas( color    )'.should be_parsed_to(func)
    end

    it "should parse the hayBolitas(exp) function" do
      arg = VarName.new 'color'
      func = HayBolitas.new arg
      'hayBolitas(color)'.should be_parsed_to(func)
      'hayBolitas(    color )'.should be_parsed_to(func)
    end

    it "should parse the puedeMover(exp) function" do
      arg = VarName.new 'dir'
      func = PuedeMover.new arg
      'puedeMover(dir)'.should be_parsed_to(func)
      'puedeMover(  dir  )'.should be_parsed_to(func)
    end

  end

end
