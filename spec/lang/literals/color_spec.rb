RSpec.describe Color do
  let(:all) { Color.all.map(&:new) }

  it 'includes Azul, Negro, Rojo and Verde' do
    expect(all.include?(azul)).to be(true)
    expect(all.include?(negro)).to be(true)
    expect(all.include?(rojo)).to be(true)
    expect(all.include?(verde)).to be(true)
  end

  it 'includes all color classes in the order specification' do
    Color.all.each do |color_class|
      expect(Color.order.include?(color_class)).to be(true)
    end
  end

  it 'evaluates any color to itself' do
    all.each { |color| expect(color.evaluate).to eq(color) }
  end

  it 'returns the string representation' do
    expect(all.map(&:to_s)).to eq(%w[Azul Negro Rojo Verde])
  end
end
