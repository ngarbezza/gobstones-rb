describe Gobstones::Parser do

  describe "basic data types" do

    describe "numbers" do

      it "should parse a positive number" do
        '42'.should be_parsed_to 42
      end

      it "should parse a negative number" do
        '-42'.should be_parsed_to -42
      end

    end

    describe "booleans" do

      it "should parse a true boolean" do
        'True'.should be_parsed_to true
      end

      it "should parse a false boolean" do
        'False'.should be_parsed_to false
      end

    end

    describe "colors" do

      it "should parse the 'Azul' color" do
        'Azul'.should be_parsed_to Gobstones::Colors::Azul.new
      end

      it "should parse the 'Negro' color" do
        'Negro'.should be_parsed_to Gobstones::Colors::Negro.new
      end

      it "should parse the 'Rojo' color" do
        'Rojo'.should be_parsed_to Gobstones::Colors::Rojo.new
      end

      it "should parse the 'Verde' color" do
        'Verde'.should be_parsed_to Gobstones::Colors::Verde.new
      end

    end

    describe "directions" do

      it "should parse the 'Norte' direction" do
        'Norte'.should be_parsed_to Gobstones::Directions::Norte.new
      end

      it "should parse the 'Este' direction" do
        'Este'.should be_parsed_to Gobstones::Directions::Este.new
      end

      it "should parse the 'Sur' direction" do
        'Sur'.should be_parsed_to Gobstones::Directions::Sur.new
      end

      it "should parse the 'Oeste' direction" do
        'Oeste'.should be_parsed_to Gobstones::Directions::Oeste.new
      end

    end

  end

  describe "primitive expressions" do

    describe "variable identifiers" do

      it "should parse valid var names" do
        'v'.should be_parsed_to Gobstones::Expressions::VarName.new('v')
        'var1'.should be_parsed_to Gobstones::Expressions::VarName.new('var1')
        'a_var'.should be_parsed_to Gobstones::Expressions::VarName.new('a_var')
        'vAR'.should be_parsed_to Gobstones::Expressions::VarName.new('vAR')
      end

      it "should not parse invalid var names" do
        '1'.should_not be_parsed_to Gobstones::Expressions::VarName.new('1')
        '_var'.should_not be_parsed_to Gobstones::Expressions::VarName.new('_var')
        'Var'.should_not be_parsed_to Gobstones::Expressions::VarName.new('Var')
      end

      it "should not parse reserved words as var names" do
        Gobstones::RESERVED_IDS.each do |id|
          id.should_not be_parsed_to Gobstones::Expressions::VarName.new(id)
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
        'minColor()'.should be_parsed_to Gobstones::Colors::Azul.new
      end

      it "should parse the maxColor() function" do
        'maxColor()'.should be_parsed_to Gobstones::Colors::Verde.new
      end

      it "should parse the minDir() function" do
        'minDir()'.should be_parsed_to Gobstones::Directions::Norte.new
      end

      it "should parse the maxDir() function" do
        'maxDir()'.should be_parsed_to Gobstones::Directions::Oeste.new
      end

    end

    describe "other type functions" do

      it "should parse the siguiente() function " do
        arg = Gobstones::Expressions::VarName.new 'x'
        func = Gobstones::Functions::Siguiente.new arg
        'siguiente(x)'.should be_parsed_to(func)
        'siguiente(x    )'.should be_parsed_to(func)
      end

      it "should parse the previo() function" do
        arg = Gobstones::Expressions::VarName.new 'y'
        func = Gobstones::Functions::Previo.new arg
        'previo(y)'.should be_parsed_to(func)
        'previo(   y )'.should be_parsed_to(func)
      end

      it "should parse the opuesto() function" do
        arg = Gobstones::Expressions::VarName.new 'z'
        func = Gobstones::Functions::Opuesto.new arg
        'opuesto(z)'.should be_parsed_to(func)
        'opuesto(   z )'.should be_parsed_to(func)
      end

    end

    describe "board primitive functions" do

      it "should parse the nroBolitas(exp) function" do
        arg = Gobstones::Expressions::VarName.new 'color'
        func = Gobstones::Functions::NroBolitas.new arg
        'nroBolitas(color)'.should be_parsed_to(func)
        'nroBolitas( color    )'.should be_parsed_to(func)
      end

      it "should parse the hayBolitas(exp) function" do
        arg = Gobstones::Expressions::VarName.new 'color'
        func = Gobstones::Functions::HayBolitas.new arg
        'hayBolitas(color)'.should be_parsed_to(func)
        'hayBolitas(    color )'.should be_parsed_to(func)
      end

      it "should parse the puedeMover(exp) function" do
        arg = Gobstones::Expressions::VarName.new 'dir'
        func = Gobstones::Functions::PuedeMover.new arg
        'puedeMover(dir)'.should be_parsed_to(func)
        'puedeMover(  dir  )'.should be_parsed_to(func)
      end
    end

  end

  describe "arithmetic expressions" do

    it "should parse a + expression" do
      arg1 = Gobstones::Expressions::VarName.new 'left'
      arg2 = Gobstones::Expressions::VarName.new 'right'
      sum = Gobstones::Expressions::Add.new arg1, arg2
      'left+right'.should be_parsed_to sum
      'left +  right'.should be_parsed_to sum
    end

    it "should parse a nested + expression" do
      arg1 = Gobstones::Expressions::VarName.new 'first'
      arg2 = Gobstones::Expressions::VarName.new 'second'
      arg3 = Gobstones::Expressions::VarName.new 'third'
      sum1plus2 = Gobstones::Expressions::Add.new arg1, arg2
      total = Gobstones::Expressions::Add.new sum1plus2, arg3
      'first + second + third'.should be_parsed_to total
    end

    it "should parse a - expression" do
      arg1 = Gobstones::Expressions::VarName.new 'left'
      arg2 = Gobstones::Expressions::VarName.new 'right'
      sum = Gobstones::Expressions::Sub.new arg1, arg2
      'left-right'.should be_parsed_to sum
      'left -  right'.should be_parsed_to sum
    end

    it "should parse a nested expression with + and -" do
      arg1 = Gobstones::Expressions::VarName.new 'first'
      arg2 = Gobstones::Expressions::VarName.new 'second'
      arg3 = Gobstones::Expressions::VarName.new 'third'
      sum1plus2 = Gobstones::Expressions::Add.new arg1, arg2
      total = Gobstones::Expressions::Sub.new sum1plus2, arg3
      'first + second - third'.should be_parsed_to total
    end

  end

  describe "commands" do

    describe "primitive commands" do

      it "should parse a Poner() command" do
        pending
      end

    end

    describe "control structure commands" do

    end
  end
end
