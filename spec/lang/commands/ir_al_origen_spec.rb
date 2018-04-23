RSpec.describe IrAlOrigen do
  let(:context) { clean_context }

  it 'puts the head in 0, 0 when evaluating' do
    context.head.move_north
    context.head.move_east
    described_class.new.evaluate context

    expect_positioned_at(0, 0)
  end
end
