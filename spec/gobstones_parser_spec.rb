RSpec::Matchers.define :parse_and_eval_to do |expected|
  match do |actual|
    parser = Gobstones::Parser.new
    @node = parser.parse actual
    @node.value.should == expected
  end
  failure_message_for_should do |actual|
    value = @node ? @node.value : nil
    "expected #{actual} to parse and eval to #{expected}, but got #{value}"
  end
end

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
