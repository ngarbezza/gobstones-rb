describe Gobstones::Parser do

  before(:each) do
    @parser = Gobstones::Parser.new
  end

  describe "basic data types" do

    describe "numbers" do

      it "should parse a positive number" do
        node = @parser.parse '42'
        node.value.should == 42
      end

      it "should parse a negative number" do
        node = @parser.parse '-42'
        node.value.should == -42
      end
    end

    describe "booleans" do

      it "should parse a true boolean" do
        node = @parser.parse 'True'
        node.value.should == true
      end

      it "should parse a false boolean" do
        node = @parser.parse 'False'
        node.value.should == false
      end

    end

    describe "colors" do

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
