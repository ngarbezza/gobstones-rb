describe "arithmetic expressions" do

  describe Add do

    it "should evaluate with two numbers" do
      n1 = Number.new 42
      n2 = Number.new 23
      add = Add.new n1, n2

      add.evaluate.should == Number.new(65)
    end

    it "should evaluate nested add expressions" do
      add_4_8 = Add.new Number.new(4), Number.new(8)
      add_12_15 = Add.new add_4_8, Number.new(15)
      add_27_16 = Add.new add_12_15, Number.new(16)
      add_43_23 = Add.new add_27_16, Number.new(23)
      add_66_42 = Add.new add_43_23, Number.new(42)

      add_66_42.evaluate.should == Number.new(108)
    end

  end

  describe Sub do

    it "should evaluate with two numbers" do
      n1 = Number.new 42
      n2 = Number.new 15
      sub = Sub.new n1, n2

      sub.evaluate.should == Number.new(27)
    end

    it "should evaluate and return a negative result" do
      n1 = Number.new 42
      n2 = Number.new 15
      sub = Sub.new n2, n1

      sub.evaluate.should == Number.new(-27)
    end

    it "should evaluate nested sub expressions" do
      n1 = Number.new 42
      n2 = Number.new 15
      sub_n1_n2 = Sub.new n1, n2
      n3 = Number.new 8
      sub = Sub.new sub_n1_n2, n3

      sub.evaluate.should == Number.new(19)
    end

  end

  describe Mul do

    it "should evaluate a simple mul" do
      Mul.new(Number.new(4), Number.new(8)).evaluate.should == Number.new(32)
    end

    it "should evaluate a nested mul expression" do
      mul = Mul.new(Number.new(-2), Number.new(4))
      Mul.new(mul, Number.new(5)).evaluate.should == Number.new(-40)
    end

  end

  describe Div do

    it "should evaluate a simple div" do
      Div.new(Number.new(12), Number.new(3)).evaluate.should == Number.new(4)
    end

    it "should evaluate to an integer division" do
      Div.new(Number.new(10), Number.new(3)).evaluate.should == Number.new(3)
    end

    it "should raise an error when dividing by zero" do
      expect {
        Div.new(Number.new(42), Number.new(0)).evaluate
      }.to raise_error(GbsRuntimeError, "zero division")
    end

  end

  describe Mod do
    # TODO
  end

  describe Pow do
    # TODO
  end

end
