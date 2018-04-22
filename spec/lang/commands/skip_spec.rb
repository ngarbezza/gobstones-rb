RSpec.describe Skip do
  let(:context) { clean_context }

  it 'evaluates and does nothing' do
    Skip.new.evaluate context

    expect(context.head.x_pos).to eq(0)
    expect(context.head.y_pos).to eq(0)
    expect(context.head.board).to be_empty
  end
end
