describe 'type bound functions' do
  describe 'for booleans' do
    it 'evaluates minBool() to False' do
      expect(MinBool.new.evaluate).to eq(false_value)
    end

    it 'evaluates maxBool() to True' do
      expect(MaxBool.new.evaluate).to eq(true_value)
    end
  end

  describe 'for colors' do
    it 'evaluates minColor() to Azul' do
      expect(MinColor.new.evaluate).to eq(azul)
    end

    it 'evaluates maxColor() to Verde' do
      expect(MaxColor.new.evaluate).to eq(verde)
    end
  end

  describe 'for directions' do
    it 'evaluates minDir() to Norte' do
      expect(MinDir.new.evaluate).to eq(norte)
    end

    it 'evaluates maxDir() to Oeste' do
      expect(MaxDir.new.evaluate).to eq(oeste)
    end
  end
end
