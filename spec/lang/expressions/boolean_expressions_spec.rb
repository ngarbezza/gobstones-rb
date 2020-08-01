# TODO test/implement short-circuit?
RSpec.describe 'evaluating boolean expressions' do
  let(:context) { any_context }

  describe And do
    it 'evaluates a simple and expression' do
      expect(described_class.new(false_value, false_value).evaluate(context)).to eq(false_value)
      expect(described_class.new(false_value, true_value).evaluate(context)).to eq(false_value)
      expect(described_class.new(true_value, false_value).evaluate(context)).to eq(false_value)
      expect(described_class.new(true_value, true_value).evaluate(context)).to eq(true_value)
    end
  end

  describe Or do
    it 'evaluates a simple or expression' do
      expect(described_class.new(false_value, false_value).evaluate(context)).to eq(false_value)
      expect(described_class.new(false_value, true_value).evaluate(context)).to eq(true_value)
      expect(described_class.new(true_value, false_value).evaluate(context)).to eq(true_value)
      expect(described_class.new(true_value, true_value).evaluate(context)).to eq(true_value)
    end
  end

  describe Not do
    it 'evaluates a simple not expression' do
      expect(described_class.new(false_value).evaluate(context)).to eq(true_value)
      expect(described_class.new(true_value).evaluate(context)).to eq(false_value)
    end

    it 'evaluates a double negated expression' do
      expect(described_class.new(described_class.new(false_value)).evaluate(context)).to eq(false_value)
      expect(described_class.new(described_class.new(true_value)).evaluate(context)).to eq(true_value)
    end

    it 'fails if the argument is not a boolean' do
      expect { described_class.new(42.to_gbs_num).evaluate(context) }.
          to raise_error(GobstonesTypeError, /is not a boolean/)
      expect { described_class.new(azul).evaluate(context) }.
          to raise_error(GobstonesTypeError, /is not a boolean/)
      expect { described_class.new(oeste).evaluate(context) }.
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
