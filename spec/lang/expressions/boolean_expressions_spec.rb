describe "boolean expressions" do

  let(:false_value) { False.new }
  let(:true_value) { True.new }

  # TODO test/implement short-circuit?

  describe And do

    it "should evaluate a simple and expression" do
      And.new(false_value, false_value).evaluate.should == false_value
      And.new(false_value, true_value).evaluate.should == false_value
      And.new(true_value, false_value).evaluate.should == false_value
      And.new(true_value, true_value).evaluate.should == true_value
    end

  end

  describe Or do

    it "should evaluate a simple or expression" do
      Or.new(false_value, false_value).evaluate.should == false_value
      Or.new(false_value, true_value).evaluate.should == true_value
      Or.new(true_value, false_value).evaluate.should == true_value
      Or.new(true_value, true_value).evaluate.should == true_value
    end

  end

  describe Not do

    it "should evaluate a simple not expression" do
      Not.new(false_value).evaluate.should == true_value
      Not.new(true_value).evaluate.should == false_value
    end

    it "should evaluate a not not expression" do
      Not.new(Not.new(false_value)).evaluate.should == false_value
      Not.new(Not.new(true_value)).evaluate.should == true_value
    end

  end

  describe "nested" do

    it "should evaluate and's and or's" do
      And.new(Or.new(false_value, true_value), true_value).evaluate.should == true_value
    end

    it "should evaluate and's, or's, and not's" do
      Not.new(Or.new(false_value, And.new(true_value, true_value))).evaluate.should == false_value
    end

  end

end