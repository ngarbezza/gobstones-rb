describe Boolean do

  it 'evaluates true to itself' do
    expect(true_value.evaluate).to eq(true_value)
  end

  it 'evaluates false to itself' do
    expect(false_value.evaluate).to eq(false_value)
  end

end
