describe Gobstones::Parser, "primitive expressions" do

  describe "variable identifiers" do

    it "should parse valid var names" do
      'v'.should be_parsed_to Expressions::VarName.new('v')
      'var1'.should be_parsed_to Expressions::VarName.new('var1')
      'a_var'.should be_parsed_to Expressions::VarName.new('a_var')
      'vAR'.should be_parsed_to Expressions::VarName.new('vAR')
    end

    it "should not parse invalid var names" do
      '1'.should_not be_parsed_to Expressions::VarName.new('1')
      '_var'.should_not be_parsed_to Expressions::VarName.new('_var')
      'Var'.should_not be_parsed_to Expressions::VarName.new('Var')
    end

    it "should not parse reserved words as var names" do
      RESERVED_IDS.each do |id|
        id.should_not be_parsed_to Expressions::VarName.new(id)
      end
    end

  end

  describe "type bounds functions" do

    it "should parse the minBool() function" do
      'minBool()'.should be_parsed_to false
    end

    it "should parse the maxBool() function" do
      'maxBool()'.should be_parsed_to true
    end

    it "should parse the minColor() function" do
      'minColor()'.should be_parsed_to Colors::Azul.new
    end

    it "should parse the maxColor() function" do
      'maxColor()'.should be_parsed_to Colors::Verde.new
    end

    it "should parse the minDir() function" do
      'minDir()'.should be_parsed_to Directions::Norte.new
    end

    it "should parse the maxDir() function" do
      'maxDir()'.should be_parsed_to Directions::Oeste.new
    end

  end

  describe "other type functions" do

    it "should parse the siguiente() function " do
      arg = Expressions::VarName.new 'x'
      func = Functions::Siguiente.new arg
      'siguiente(x)'.should be_parsed_to(func)
      'siguiente(x    )'.should be_parsed_to(func)
    end

    it "should parse the previo() function" do
      arg = Expressions::VarName.new 'y'
      func = Functions::Previo.new arg
      'previo(y)'.should be_parsed_to(func)
      'previo(   y )'.should be_parsed_to(func)
    end

    it "should parse the opuesto() function" do
      arg = Expressions::VarName.new 'z'
      func = Functions::Opuesto.new arg
      'opuesto(z)'.should be_parsed_to(func)
      'opuesto(   z )'.should be_parsed_to(func)
    end

  end

  describe "board primitive functions" do

    it "should parse the nroBolitas(exp) function" do
      arg = Expressions::VarName.new 'color'
      func = Functions::NroBolitas.new arg
      'nroBolitas(color)'.should be_parsed_to(func)
      'nroBolitas( color    )'.should be_parsed_to(func)
    end

    it "should parse the hayBolitas(exp) function" do
      arg = Expressions::VarName.new 'color'
      func = Functions::HayBolitas.new arg
      'hayBolitas(color)'.should be_parsed_to(func)
      'hayBolitas(    color )'.should be_parsed_to(func)
    end

    it "should parse the puedeMover(exp) function" do
      arg = Expressions::VarName.new 'dir'
      func = Functions::PuedeMover.new arg
      'puedeMover(dir)'.should be_parsed_to(func)
      'puedeMover(  dir  )'.should be_parsed_to(func)
    end

  end

end
