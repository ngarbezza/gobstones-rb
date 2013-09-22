describe Gobstones::Parser, "primitive expressions" do

  describe "variable identifiers" do

    it "should parse valid var names" do
      'v'.should be_parsed_as(:expression).and_return(VarName.new('v'))
      'var1'.should be_parsed_as(:expression).and_return(VarName.new('var1'))
      'a_var'.should be_parsed_as(:expression).and_return(VarName.new('a_var'))
      'vAR'.should be_parsed_as(:expression).and_return(VarName.new('vAR'))
    end

    it "should not parse invalid var names" do
      '1'.should_not be_parsed_as(:expression).and_return(VarName.new('1'))
      '_var'.should be_parsed_as(:expression).and_fail
      'Var'.should be_parsed_as(:expression).and_fail
    end

    it "should not parse reserved words as var names" do
      literals = %w{True False Rojo Negro Azul Verde Norte Oeste Este Sur}
      (RESERVED_IDS - literals).each do |id|
        id.should be_parsed_as(:expression).and_fail
      end
    end

  end

  describe "type bounds functions" do

    it "should parse the minBool() function" do
      'minBool()'.should be_parsed_as(:expression).and_return(MinBool.new)
    end

    it "should parse the maxBool() function" do
      'maxBool()'.should be_parsed_as(:expression).and_return(MaxBool.new)
    end

    it "should parse the minColor() function" do
      'minColor()'.should be_parsed_as(:expression).and_return(MinColor.new)
    end

    it "should parse the maxColor() function" do
      'maxColor()'.should be_parsed_as(:expression).and_return(MaxColor.new)
    end

    it "should parse the minDir() function" do
      'minDir()'.should be_parsed_as(:expression).and_return(MinDir.new)
    end

    it "should parse the maxDir() function" do
      'maxDir()'.should be_parsed_as(:expression).and_return(MaxDir.new)
    end

  end

  describe "other type functions" do

    it "should parse the siguiente() function " do
      arg = VarName.new 'x'
      func = Siguiente.new arg
      'siguiente(x)'.should be_parsed_as(:expression).and_return(func)
      'siguiente(x    )'.should be_parsed_as(:expression).and_return(func)
    end

    it "should parse the previo() function" do
      arg = VarName.new 'y'
      func = Previo.new arg
      'previo(y)'.should be_parsed_as(:expression).and_return(func)
      'previo(   y )'.should be_parsed_as(:expression).and_return(func)
    end

    it "should parse the opuesto() function" do
      arg = VarName.new 'z'
      func = Opuesto.new arg
      'opuesto(z)'.should be_parsed_as(:expression).and_return(func)
      'opuesto(   z )'.should be_parsed_as(:expression).and_return(func)
    end

  end

  describe "board primitive functions" do

    it "should parse the nroBolitas(exp) function" do
      arg = VarName.new 'color'
      func = NroBolitas.new arg
      'nroBolitas(color)'.should be_parsed_as(:expression).and_return(func)
      'nroBolitas( color  )'.should be_parsed_as(:expression).and_return(func)
    end

    it "should parse the hayBolitas(exp) function" do
      arg = VarName.new 'color'
      func = HayBolitas.new arg
      'hayBolitas(color)'.should be_parsed_as(:expression).and_return(func)
      'hayBolitas(  color )'.should be_parsed_as(:expression).and_return(func)
    end

    it "should parse the puedeMover(exp) function" do
      arg = VarName.new 'dir'
      func = PuedeMover.new arg
      'puedeMover(dir)'.should be_parsed_as(:expression).and_return(func)
      'puedeMover(  dir  )'.should be_parsed_as(:expression).and_return(func)
    end

  end

end