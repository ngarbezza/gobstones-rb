describe "directions" do

  let(:all) { [Norte.new, Sur.new, Este.new, Oeste.new] }

  it "should evaluate any direction to self" do
    all.each { |dir| expect(dir.evaluate).to eq(dir) }
  end

  it "should return the string representation" do
    expect(all.map(&:to_s)).to eq(['Norte', 'Sur', 'Este', 'Oeste'])
  end

  describe Norte do

    it "should return Sur as opposite direction" do
      expect(Norte.new.opposite).to eq(Sur.new)
    end

  end

  describe Este do

    it "should return Oeste as opposite direction" do
      expect(Este.new.opposite).to eq(Oeste.new)
    end

  end

  describe Sur do

    it "should return Norte as opposite direction" do
      expect(Sur.new.opposite).to eq(Norte.new)
    end

  end

  describe Oeste do

    it "should return Este as opposite direction" do
      expect(Oeste.new.opposite).to eq(Este.new)
    end

  end

end
