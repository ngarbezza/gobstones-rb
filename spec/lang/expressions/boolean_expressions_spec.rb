describe "boolean expressions" do

  let(:false_value) { False.new }
  let(:true_value) { True.new }
  let(:context) { NullExecutionContext.new }

  # TODO test/implement short-circuit?

  describe And do

    it "should evaluate a simple and expression" do
      expect(And.new(false_value, false_value).evaluate(context)).to eq(false_value)
      expect(And.new(false_value, true_value).evaluate(context)).to eq(false_value)
      expect(And.new(true_value, false_value).evaluate(context)).to eq(false_value)
      expect(And.new(true_value, true_value).evaluate(context)).to eq(true_value)
    end

  end

  describe Or do

    it "should evaluate a simple or expression" do
      expect(Or.new(false_value, false_value).evaluate(context)).to eq(false_value)
      expect(Or.new(false_value, true_value).evaluate(context)).to eq(true_value)
      expect(Or.new(true_value, false_value).evaluate(context)).to eq(true_value)
      expect(Or.new(true_value, true_value).evaluate(context)).to eq(true_value)
    end

  end

  describe Not do

    it "should evaluate a simple not expression" do
      expect(Not.new(false_value).evaluate(context)).to eq(true_value)
      expect(Not.new(true_value).evaluate(context)).to eq(false_value)
    end

    it "should evaluate a not not expression" do
      expect(Not.new(Not.new(false_value)).evaluate(context)).to eq(false_value)
      expect(Not.new(Not.new(true_value)).evaluate(context)).to eq(true_value)
    end

  end

  describe "nested" do

    it "should evaluate and's and or's" do
      expression = And.new Or.new(false_value, true_value), true_value

      expect(expression.evaluate(context)).to eq(true_value)
    end

    it "should evaluate and's, or's, and not's" do
      expression = Not.new Or.new(false_value, And.new(true_value, true_value))
      expect(expression.evaluate(context)).to eq(false_value)
    end

  end

end
