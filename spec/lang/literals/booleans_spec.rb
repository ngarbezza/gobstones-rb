describe Boolean do

  it "should evaluate true to self" do
    bool = True.new
    bool.evaluate.should == bool
  end

  it "should evaluate false to self" do
    bool = False.new
    bool.evaluate.should == bool
  end

end