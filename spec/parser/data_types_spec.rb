describe Gobstones::Parser, "data types" do

  describe "numbers" do

    it "should parse a positive number" do
      expect('42').to be_parsed_as(:expression).and_return(42.to_gbs_num)
    end

    it "should parse a negative number" do
      expect('-42').to be_parsed_as(:expression).and_return(-42.to_gbs_num)
    end

  end

  describe "booleans" do

    it "should parse a true boolean" do
      expect('True').to be_parsed_as(:expression).and_return(True.new)
    end

    it "should parse a false boolean" do
      expect('False').to be_parsed_as(:expression).and_return(False.new)
    end

  end

  describe "colors" do

    it "should parse the 'Azul' color" do
      expect('Azul').to be_parsed_as(:expression).and_return(Azul.new)
    end

    it "should parse the 'Negro' color" do
      expect('Negro').to be_parsed_as(:expression).and_return(Negro.new)
    end

    it "should parse the 'Rojo' color" do
      expect('Rojo').to be_parsed_as(:expression).and_return(Rojo.new)
    end

    it "should parse the 'Verde' color" do
      expect('Verde').to be_parsed_as(:expression).and_return(Verde.new)
    end

  end

  describe "directions" do

    it "should parse the 'Norte' direction" do
      expect('Norte').to be_parsed_as(:expression).and_return(Norte.new)
    end

    it "should parse the 'Este' direction" do
      expect('Este').to be_parsed_as(:expression).and_return(Este.new)
    end

    it "should parse the 'Sur' direction" do
      expect('Sur').to be_parsed_as(:expression).and_return(Sur.new)
    end

    it "should parse the 'Oeste' direction" do
      expect('Oeste').to be_parsed_as(:expression).and_return(Oeste.new)
    end

  end

end
