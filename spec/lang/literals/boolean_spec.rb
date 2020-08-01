RSpec.describe Boolean do
  let(:context) { any_context }

  it 'evaluates true to itself' do
    expect(true_value.evaluate(context)).to eq(true_value)
  end

  it 'evaluates false to itself' do
    expect(false_value.evaluate(context)).to eq(false_value)
  end
end
