describe "directions" do

  describe Norte do

    it "should return Sur as opposite direction" do
      Norte.new.opposite.should == Sur.new
    end

  end

  describe Este do

    it "should return Oeste as opposite direction" do
      Este.new.opposite.should == Oeste.new
    end

  end

  describe Sur do

    it "should return Norte as opposite direction" do
      Sur.new.opposite.should == Norte.new
    end

  end

  describe Oeste do

    it "should return Este as opposite direction" do
      Oeste.new.opposite.should == Este.new
    end

  end

end
