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

end
