describe Gobstones::Parser, "data types" do

  describe "numbers" do

    it "should parse a positive number" do
      '42'.should be_parsed_as(:expression).and_return(Number.new(42))
    end

    it "should parse a negative number" do
      '-42'.should be_parsed_as(:expression).and_return(Number.new(-42))
    end

  end

  describe "booleans" do

    it "should parse a true boolean" do
      'True'.should be_parsed_as(:expression).and_return(True.new)
    end

    it "should parse a false boolean" do
      'False'.should be_parsed_as(:expression).and_return(False.new)
    end

  end

  describe "colors" do

    it "should parse the 'Azul' color" do
      'Azul'.should be_parsed_as(:expression).and_return(Azul.new)
    end

    it "should parse the 'Negro' color" do
      'Negro'.should be_parsed_as(:expression).and_return(Negro.new)
    end

    it "should parse the 'Rojo' color" do
      'Rojo'.should be_parsed_as(:expression).and_return(Rojo.new)
    end

    it "should parse the 'Verde' color" do
      'Verde'.should be_parsed_as(:expression).and_return(Verde.new)
    end

  end

  describe "directions" do

    it "should parse the 'Norte' direction" do
      'Norte'.should be_parsed_as(:expression).and_return(Norte.new)
    end

    it "should parse the 'Este' direction" do
      'Este'.should be_parsed_as(:expression).and_return(Este.new)
    end

    it "should parse the 'Sur' direction" do
      'Sur'.should be_parsed_as(:expression).and_return(Sur.new)
    end

    it "should parse the 'Oeste' direction" do
      'Oeste'.should be_parsed_as(:expression).and_return(Oeste.new)
    end

  end

end
