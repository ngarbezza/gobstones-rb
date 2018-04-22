RSpec.describe CommandBlock do
  let(:context) { clean_context }

  it 'evaluates all inner commands' do
    command_block = described_class.new([Poner.new(rojo), Poner.new(verde), Poner.new(negro), Poner.new(azul)])
    command_block.evaluate context

    expect(context.head.are_there_balls?(azul)).to be(true)
    expect(context.head.are_there_balls?(negro)).to be(true)
    expect(context.head.are_there_balls?(rojo)).to be(true)
    expect(context.head.are_there_balls?(verde)).to be(true)
  end

  it 'builds an empty command block' do
    expect(described_class.new([])).to be_empty
    expect(described_class.empty).to be_empty
  end
end
