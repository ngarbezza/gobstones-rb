# TODO test/implement short-circuit?
describe 'boolean expressions' do

  let(:context) { clean_context }

  describe And do

    it 'evaluates a simple and expression' do
      expect(And.new(false_value, false_value).evaluate(context)).to eq(false_value)
      expect(And.new(false_value, true_value).evaluate(context)).to eq(false_value)
      expect(And.new(true_value, false_value).evaluate(context)).to eq(false_value)
      expect(And.new(true_value, true_value).evaluate(context)).to eq(true_value)
    end

  end

  describe Or do

    it 'evaluates a simple or expression' do
      expect(Or.new(false_value, false_value).evaluate(context)).to eq(false_value)
      expect(Or.new(false_value, true_value).evaluate(context)).to eq(true_value)
      expect(Or.new(true_value, false_value).evaluate(context)).to eq(true_value)
      expect(Or.new(true_value, true_value).evaluate(context)).to eq(true_value)
    end

  end

  describe Not do

    it 'evaluates a simple not expression' do
      expect(Not.new(false_value).evaluate(context)).to eq(true_value)
      expect(Not.new(true_value).evaluate(context)).to eq(false_value)
    end

    it 'evaluates a double negated expression' do
      expect(Not.new(Not.new(false_value)).evaluate(context)).to eq(false_value)
      expect(Not.new(Not.new(true_value)).evaluate(context)).to eq(true_value)
    end

    it 'fails if the argument is not a boolean' do
      expect { Not.new(42.to_gbs_num).evaluate(context) }.
          to raise_error(GobstonesTypeError, /is not a boolean/)
      expect { Not.new(azul).evaluate(context) }.
          to raise_error(GobstonesTypeError, /is not a boolean/)
      expect { Not.new(oeste).evaluate(context) }.
          to raise_error(GobstonesTypeError, /is not a boolean/)
    end

  end

  describe 'nested' do

    it "evaluates and's and or's" do
      expression = And.new(Or.new(false_value, true_value), true_value)

      expect(expression.evaluate(context)).to eq(true_value)
    end

    it "evaluates and's, or's, and not's" do
      expression = Not.new(Or.new(false_value, And.new(true_value, true_value)))

      expect(expression.evaluate(context)).to eq(false_value)
    end

  end
end
