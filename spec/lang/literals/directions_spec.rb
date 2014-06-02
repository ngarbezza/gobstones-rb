describe "directions" do

  let(:all) { [norte, sur, este, oeste] }

  it "should evaluate any direction to self" do
    all.each { |dir| expect(dir.evaluate).to eq(dir) }
  end

  it "should return the string representation" do
    expect(all.map(&:to_s)).to eq(['Norte', 'Sur', 'Este', 'Oeste'])
  end

  describe Norte do

    it "should return Sur as opposite direction" do
      expect(norte.opposite).to eq(sur)
    end

  end

  describe Este do

    it "should return Oeste as opposite direction" do
      expect(este.opposite).to eq(oeste)
    end

  end

  describe Sur do

    it "should return Norte as opposite direction" do
      expect(sur.opposite).to eq(norte)
    end

  end

  describe Oeste do

    it "should return Este as opposite direction" do
      expect(oeste.opposite).to eq(este)
    end

  end

end
