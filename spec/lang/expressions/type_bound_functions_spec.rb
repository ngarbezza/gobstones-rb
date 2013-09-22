describe "type bound functions" do

  describe "boolean" do

    it "should evaluate minBool() to False" do
      MinBool.new.evaluate.should == False.new
    end

    it "should evaluate maxBool() to True" do
      MaxBool.new.evaluate.should == True.new
    end

  end

  describe "colors" do

    it "should evaluate minColor() to Azul" do
      MinColor.new.evaluate.should == Azul.new
    end

    it "should evaluate maxColor() to Verde" do
      MaxColor.new.evaluate.should == Verde.new
    end

  end

  describe "directions" do

    it "should evaluate minDir() to Norte" do
      MinDir.new.evaluate.should == Norte.new
    end

    it "should evaluate maxDir() to Oeste" do
      MaxDir.new.evaluate.should == Oeste.new
    end

  end

end