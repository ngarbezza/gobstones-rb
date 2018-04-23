RSpec.describe Skip do
  let(:context) { clean_context }

  it 'evaluates and does nothing' do
    described_class.new.evaluate(context)

    expect_positioned_at(0, 0)
    expect(context.head.board).to be_empty
  end
end
