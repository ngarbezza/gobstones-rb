describe "type bound functions" do

  describe "boolean" do

    it "should evaluate minBool() to False" do
      expect(MinBool.new.evaluate).to eq(false_value)
    end

    it "should evaluate maxBool() to True" do
      expect(MaxBool.new.evaluate).to eq(true_value)
    end

  end

  describe "colors" do

    it "should evaluate minColor() to Azul" do
      expect(MinColor.new.evaluate).to eq(azul)
    end

    it "should evaluate maxColor() to Verde" do
      expect(MaxColor.new.evaluate).to eq(verde)
    end

  end

  describe "directions" do

    it "should evaluate minDir() to Norte" do
      expect(MinDir.new.evaluate).to eq(Norte.new)
    end

    it "should evaluate maxDir() to Oeste" do
      expect(MaxDir.new.evaluate).to eq(Oeste.new)
    end

  end

end
