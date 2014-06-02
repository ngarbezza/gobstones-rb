describe Boolean do

  it "should evaluate true to self" do
    expect(true_value.evaluate).to eq(true_value)
  end

  it "should evaluate false to self" do
    expect(false_value.evaluate).to eq(false_value)
  end

end
