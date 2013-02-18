describe "literals" do

  describe Number do

    it "should evaluate to self" do
      num = Number.new(42)
      num.evaluate.should == num
    end

  end

end
