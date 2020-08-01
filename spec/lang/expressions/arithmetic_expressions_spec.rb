RSpec.describe 'arithmetic expressions' do
  let(:context) { any_context }

  describe Add do
    it 'evaluates with two numbers' do
      expect(described_class.numbers(42, 23).evaluate(context)).to eq(65.to_gbs_num)
    end

    it 'evaluates nested add expressions' do
      add_4_8 = described_class.numbers(4, 8)
      add_12_15 = described_class.new(add_4_8, 15.to_gbs_num)
      add_27_16 = described_class.new(add_12_15, 16.to_gbs_num)
      add_43_23 = described_class.new(add_27_16, 23.to_gbs_num)
      add_66_42 = described_class.new(add_43_23, 42.to_gbs_num)

      expect(add_66_42.evaluate(context)).to eq(108.to_gbs_num)
    end
  end

  describe Sub do
    it 'evaluates with two numbers' do
      expect(described_class.numbers(42, 15).evaluate(context)).to eq(27.to_gbs_num)
    end

    it 'evaluates returning a negative result' do
      expect(described_class.numbers(15, 42).evaluate(context)).to eq(-27.to_gbs_num)
    end

    it 'evaluates nested sub expressions' do
      sub_42_15 = described_class.numbers(42, 15)
      sub = described_class.new(sub_42_15, 8.to_gbs_num)

      expect(sub.evaluate(context)).to eq(19.to_gbs_num)
    end
  end

  describe Mul do
    it 'evaluates a simple mul' do
      expect(described_class.numbers(4, 8).evaluate).to eq(32.to_gbs_num)
    end

    it 'evaluates a nested mul expression' do
      mul = described_class.numbers(-2, 4)

      expect(described_class.new(mul, 5.to_gbs_num).evaluate(context)).to eq(-40.to_gbs_num)
    end
  end

  describe Div do
    it 'evaluates a simple div' do
      expect(described_class.numbers(12, 3).evaluate(context)).to eq(4.to_gbs_num)
    end

    it 'evaluates to an integer division' do
      expect(described_class.numbers(10, 3).evaluate(context)).to eq(3.to_gbs_num)
    end

    it 'raises an error when dividing by zero' do
      expect { described_class.numbers(42, 0).evaluate(context) }.to raise_error(GobstonesRuntimeError, 'zero division')
    end
  end

  describe Mod do
    it 'evaluates a mod with result 0' do
      expect(described_class.numbers(4, 4).evaluate(context)).to eq(0.to_gbs_num)
    end

    it 'evaluates a mod with result > 0' do
      expect(described_class.numbers(10, 3).evaluate(context)).to eq(1.to_gbs_num)
    end
  end

  describe Pow do
    it 'returns 1 as a result if the power is 0' do
      expect(described_class.numbers(1, 0).evaluate(context)).to eq(1.to_gbs_num)
      expect(described_class.numbers(42, 0).evaluate(context)).to eq(1.to_gbs_num)
    end

    it 'evaluates 2 raised to 4' do
      expect(described_class.numbers(2, 4).evaluate(context)).to eq(16.to_gbs_num)
    end
  end
end
