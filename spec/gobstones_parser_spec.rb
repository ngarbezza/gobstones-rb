describe Gobstones::Parser do

  describe "basic data types" do

    describe "numbers" do

      it "should parse a positive number" do
        '42'.should parse_and_eval_to 42
      end

      it "should parse a negative number" do
        '-42'.should parse_and_eval_to -42
      end

    end

    describe "booleans" do

      it "should parse a true boolean" do
        'True'.should parse_and_eval_to true
      end

      it "should parse a false boolean" do
        'False'.should parse_and_eval_to false
      end

    end

    describe "colors" do

      it "should parse the 'Azul' color" do
        'Azul'.should parse_and_eval_to Gobstones::Colors::Azul.new
      end

      it "should parse the 'Negro' color" do
        'Negro'.should parse_and_eval_to Gobstones::Colors::Negro.new
      end

      it "should parse the 'Rojo' color" do
        'Rojo'.should parse_and_eval_to Gobstones::Colors::Rojo.new
      end

      it "should parse the 'Verde' color" do
        'Verde'.should parse_and_eval_to Gobstones::Colors::Verde.new
      end

    end

    describe "directions" do

      it "should parse the 'Norte' direction" do
        'Norte'.should parse_and_eval_to Gobstones::Directions::Norte.new
      end

      it "should parse the 'Este' direction" do
        'Este'.should parse_and_eval_to Gobstones::Directions::Este.new
      end

      it "should parse the 'Sur' direction" do
        'Sur'.should parse_and_eval_to Gobstones::Directions::Sur.new
      end

      it "should parse the 'Oeste' direction" do
        'Oeste'.should parse_and_eval_to Gobstones::Directions::Oeste.new
      end

    end

  end

  describe "primitive expressions" do

    describe "variable identifiers" do

      it "should parse valid var names" do
        'v'.should parse_and_eval_to Gobstones::Expressions::VarName.new('v')
        'var1'.should parse_and_eval_to Gobstones::Expressions::VarName.new('var1')
        'a_var'.should parse_and_eval_to Gobstones::Expressions::VarName.new('a_var')
        'vAR'.should parse_and_eval_to Gobstones::Expressions::VarName.new('vAR')
      end

      it "should not parse invalid var names" do
        '1'.should_not parse_and_eval_to Gobstones::Expressions::VarName.new('1')
        '_var'.should_not parse_and_eval_to Gobstones::Expressions::VarName.new('_var')
        'Var'.should_not parse_and_eval_to Gobstones::Expressions::VarName.new('Var')
      end

      it "should not parse reserved words as var names" do
        Gobstones::RESERVED_IDS.each do |id|
          id.should_not parse_and_eval_to Gobstones::Expressions::VarName.new(id)
        end
      end

    end

    describe "type bounds functions" do

      it "should parse the minBool() function" do
        'minBool()'.should parse_and_eval_to false
      end

      it "should parse the maxBool() function" do
        'maxBool()'.should parse_and_eval_to true
      end

      it "should parse the minColor() function" do
        'minColor()'.should parse_and_eval_to Gobstones::Colors::Azul.new
      end

      it "should parse the maxColor() function" do
        'maxColor()'.should parse_and_eval_to Gobstones::Colors::Verde.new
      end

      it "should parse the minDir() function" do
        'minDir()'.should parse_and_eval_to Gobstones::Directions::Norte.new
      end

      it "should parse the maxDir() function" do
        'maxDir()'.should parse_and_eval_to Gobstones::Directions::Oeste.new
      end

    end

    describe "board primitive functions" do

      it "should parse the nroBolitas(exp) function" do
        arg = Gobstones::Expressions::VarName.new 'color'
        func = Gobstones::Functions::NroBolitas.new arg
        'nroBolitas(color)'.should parse_and_eval_to(func)
        'nroBolitas( color    )'.should parse_and_eval_to(func)
      end

      it "should parse the hayBolitas(exp) function" do
        arg = Gobstones::Expressions::VarName.new 'color'
        func = Gobstones::Functions::HayBolitas.new arg
        'hayBolitas(color)'.should parse_and_eval_to(func)
        'hayBolitas(    color )'.should parse_and_eval_to(func)
      end

      it "should parse the puedeMover(exp) function" do
        arg = Gobstones::Expressions::VarName.new 'dir'
        func = Gobstones::Functions::PuedeMover.new arg
        'puedeMover(color)'.should parse_and_eval_to(func)
        'puedeMover(  color  )'.should parse_and_eval_to(func)
      end
    end

  end

  describe "arithmetic operators" do
    
    it "should parse a + operator" do
      pending
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
