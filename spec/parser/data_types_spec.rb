describe Gobstones::Parser, "data types" do

  describe "numbers" do

    it "should parse a positive number" do
      '42'.should be_parsed_to Lang::Number.new(42)
    end

    it "should parse a negative number" do
      '-42'.should be_parsed_to Lang::Number.new(-42)
    end

  end

  describe "booleans" do

    it "should parse a true boolean" do
      'True'.should be_parsed_to Lang::True.new
    end

    it "should parse a false boolean" do
      'False'.should be_parsed_to Lang::False.new
    end

  end

  describe "colors" do

    it "should parse the 'Azul' color" do
      'Azul'.should be_parsed_to Lang::Azul.new
    end

    it "should parse the 'Negro' color" do
      'Negro'.should be_parsed_to Lang::Negro.new
    end

    it "should parse the 'Rojo' color" do
      'Rojo'.should be_parsed_to Lang::Rojo.new
    end

    it "should parse the 'Verde' color" do
      'Verde'.should be_parsed_to Lang::Verde.new
    end

  end

  describe "directions" do

    it "should parse the 'Norte' direction" do
      'Norte'.should be_parsed_to Lang::Norte.new
    end

    it "should parse the 'Este' direction" do
      'Este'.should be_parsed_to Lang::Este.new
    end

    it "should parse the 'Sur' direction" do
      'Sur'.should be_parsed_to Lang::Sur.new
    end

    it "should parse the 'Oeste' direction" do
      'Oeste'.should be_parsed_to Lang::Oeste.new
    end

  end

  describe "strings" do

  end

end
