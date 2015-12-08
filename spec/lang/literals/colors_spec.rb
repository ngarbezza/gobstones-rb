describe Color do

  let(:all) { [azul, negro, rojo, verde] }

  it 'evaluates any color to itself' do
    all.each { |color| expect(color.evaluate).to eq(color) }
  end

  it 'returns the string representation' do
    expect(all.map(&:to_s)).to eq(%w(Azul Negro Rojo Verde))
  end

end
