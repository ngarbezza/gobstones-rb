RSpec.describe Number do
  let(:context) { any_context }

  it 'evaluates to itself' do
    num = 42.to_gbs_num

    expect(num.evaluate(context)).to eq(num)
  end
end
