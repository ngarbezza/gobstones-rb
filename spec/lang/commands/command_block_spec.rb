RSpec.describe CommandBlock do
  let(:context) { clean_context }

  it 'evaluates all inner commands' do
    command_block = described_class.new([Poner.new(rojo), Poner.new(verde), Poner.new(negro), Poner.new(azul)])
    command_block.evaluate context

    expect_balls(azul, negro, rojo, verde)
  end

  it 'builds an empty command block' do
    expect(described_class.new([])).to be_empty
    expect(described_class.empty).to be_empty
  end
end
