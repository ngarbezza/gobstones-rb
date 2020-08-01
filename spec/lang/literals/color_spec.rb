RSpec.describe Color do
  let(:all) { described_class.all.map(&:new) }
  let(:context) { any_context }

  it 'includes Azul, Negro, Rojo and Verde' do
    expect(all).to contain_exactly(azul, negro, rojo, verde)
  end

  it 'includes all color classes in the order specification' do
    expect(described_class.all).to match_array(described_class.order)
  end

  it 'evaluates any color to itself' do
    all.each { |color| expect(color.evaluate(context)).to eq(color) }
  end

  it 'returns the string representation' do
    expect(all.map(&:to_s)).to eq(%w[Azul Negro Rojo Verde])
  end
end
