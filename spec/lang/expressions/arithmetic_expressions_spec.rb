
describe "arithmetic expressions" do

  describe Add do

    it "should evaluate with two numbers" do
      Add.new(42.to_gbs_num, 23.to_gbs_num).evaluate.should == 65.to_gbs_num
    end

    it "should evaluate nested add expressions" do
      add_4_8 = Add.new 4.to_gbs_num, 8.to_gbs_num
      add_12_15 = Add.new add_4_8, 15.to_gbs_num
      add_27_16 = Add.new add_12_15, 16.to_gbs_num
      add_43_23 = Add.new add_27_16, 23.to_gbs_num
      add_66_42 = Add.new add_43_23, 42.to_gbs_num

      add_66_42.evaluate.should == 108.to_gbs_num
    end

  end

  describe Sub do

    it "should evaluate with two numbers" do
      Sub.new(42.to_gbs_num, 15.to_gbs_num).evaluate.should == 27.to_gbs_num
    end

    it "should evaluate and return a negative result" do
      Sub.new(15.to_gbs_num, 42.to_gbs_num).evaluate.should == -27.to_gbs_num
    end

    it "should evaluate nested sub expressions" do
      sub_n1_n2 = Sub.new 42.to_gbs_num, 15.to_gbs_num
      sub = Sub.new sub_n1_n2, 8.to_gbs_num

      sub.evaluate.should == 19.to_gbs_num
    end

  end

  describe Mul do

    it "should evaluate a simple mul" do
      Mul.new(4.to_gbs_num, 8.to_gbs_num).evaluate.should == 32.to_gbs_num
    end

    it "should evaluate a nested mul expression" do
      mul = Mul.new(-2.to_gbs_num, 4.to_gbs_num)
      Mul.new(mul, 5.to_gbs_num).evaluate.should == -40.to_gbs_num
    end

  end

  describe Div do

    it "should evaluate a simple div" do
      Div.new(12.to_gbs_num, 3.to_gbs_num).evaluate.should == 4.to_gbs_num
    end

    it "should evaluate to an integer division" do
      Div.new(10.to_gbs_num, 3.to_gbs_num).evaluate.should == 3.to_gbs_num
    end

    it "should raise an error when dividing by zero" do
      expect {
        Div.new(42.to_gbs_num, 0.to_gbs_num).evaluate
      }.to raise_error(GbsRuntimeError, "zero division")
    end

  end

  describe Mod do

    it "should evaluate a mod with result 0" do
      Mod.new(4.to_gbs_num, 4.to_gbs_num).evaluate.should == 0.to_gbs_num
    end

    it "should evaluate a mod with result > 0" do
      Mod.new(10.to_gbs_num, 3.to_gbs_num).evaluate.should == 1.to_gbs_num
    end

  end

  describe Pow do

    it "should give 1 as a result if the power is 0" do
      Pow.new(1.to_gbs_num, 0.to_gbs_num).evaluate.should == 1.to_gbs_num
      Pow.new(42.to_gbs_num, 0.to_gbs_num).evaluate.should == 1.to_gbs_num
    end

    it "should calculate 2 raised to 4" do
      Pow.new(2.to_gbs_num, 4.to_gbs_num).evaluate.should == 16.to_gbs_num
    end

  end

end