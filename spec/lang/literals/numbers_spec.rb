describe Number do

  it "should evaluate to self" do
    num = 42.as_gbs_num
    num.evaluate.should == num
  end

end
