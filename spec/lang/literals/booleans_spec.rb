describe Boolean do

  it "should evaluate true to self" do
    bool = True.new
    expect(bool.evaluate).to eq(bool)
  end

  it "should evaluate false to self" do
    bool = False.new
    expect(bool.evaluate).to eq(bool)
  end

end