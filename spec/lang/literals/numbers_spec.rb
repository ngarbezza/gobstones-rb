describe Number do

  it "should evaluate to self" do
    num = 42.to_gbs_num
    num.evaluate.should == num
  end

end