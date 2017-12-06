describe Direction do
  let(:all) { Direction.all.map(&:new) }

  it 'includes Norte, Este, Sur and Oeste' do
    expect(all.include?(norte)).to be(true)
    expect(all.include?(este)).to be(true)
    expect(all.include?(sur)).to be(true)
    expect(all.include?(oeste)).to be(true)
  end

  it 'includes all direction classes in the order specification' do
    Direction.all.each do |direction_class|
      expect(Direction.order.include?(direction_class)).to be(true)
    end
  end

  it 'evaluates any direction to itself' do
    all.each { |dir| expect(dir.evaluate).to eq(dir) }
  end

  it 'returns the string representation' do
    expect(all.map(&:to_s)).to eq(%w[Norte Sur Este Oeste])
  end

  describe Norte do
    it 'returns Sur as the opposite direction' do
      expect(norte.opposite).to eq(sur)
    end
  end

  describe Este do
    it 'returns Oeste as the opposite direction' do
      expect(este.opposite).to eq(oeste)
    end
  end

  describe Sur do
    it 'returns Norte as the opposite direction' do
      expect(sur.opposite).to eq(norte)
    end
  end

  describe Oeste do
    it 'returns Este as the opposite direction' do
      expect(oeste.opposite).to eq(este)
    end
  end
end
