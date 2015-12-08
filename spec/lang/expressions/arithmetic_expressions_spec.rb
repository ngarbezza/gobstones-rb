describe 'arithmetic expressions' do

  describe Add do

    it 'evaluates with two numbers' do
      add = Add.new(42.to_gbs_num, 23.to_gbs_num)

      expect(add.evaluate).to eq(65.to_gbs_num)
    end

    it 'evaluates nested add expressions' do
      add_4_8 = Add.new(4.to_gbs_num, 8.to_gbs_num)
      add_12_15 = Add.new(add_4_8, 15.to_gbs_num)
      add_27_16 = Add.new(add_12_15, 16.to_gbs_num)
      add_43_23 = Add.new(add_27_16, 23.to_gbs_num)
      add_66_42 = Add.new(add_43_23, 42.to_gbs_num)

      expect(add_66_42.evaluate).to eq(108.to_gbs_num)
    end

  end

  describe Sub do

    it 'evaluates with two numbers' do
      sub = Sub.new(42.to_gbs_num, 15.to_gbs_num)

      expect(sub.evaluate).to eq(27.to_gbs_num)
    end

    it 'evaluates returning a negative result' do
      sub = Sub.new(15.to_gbs_num, 42.to_gbs_num)

      expect(sub.evaluate).to eq(-27.to_gbs_num)
    end

    it 'evaluates nested sub expressions' do
      sub_n1_n2 = Sub.new(42.to_gbs_num, 15.to_gbs_num)
      sub = Sub.new(sub_n1_n2, 8.to_gbs_num)

      expect(sub.evaluate).to eq(19.to_gbs_num)
    end

  end

  describe Mul do

    it 'evaluates a simple mul' do
      mul = Mul.new(4.to_gbs_num, 8.to_gbs_num)

      expect(mul.evaluate).to eq(32.to_gbs_num)
    end

    it 'evaluates a nested mul expression' do
      mul = Mul.new(-2.to_gbs_num, 4.to_gbs_num)

      expect(Mul.new(mul, 5.to_gbs_num).evaluate).to eq(-40.to_gbs_num)
    end

  end

  describe Div do

    it 'evaluates a simple div' do
      div = Div.new(12.to_gbs_num, 3.to_gbs_num)

      expect(div.evaluate).to eq(4.to_gbs_num)
    end

    it 'evaluates to an integer division' do
      div = Div.new(10.to_gbs_num, 3.to_gbs_num)

      expect(div.evaluate).to eq(3.to_gbs_num)
    end

    it 'raises an error when dividing by zero' do
      expect {
        Div.new(42.to_gbs_num, 0.to_gbs_num).evaluate
      }.to raise_error(GobstonesRuntimeError, 'zero division')
    end

  end

  describe Mod do

    it 'evaluates a mod with result 0' do
      mod = Mod.new(4.to_gbs_num, 4.to_gbs_num)

      expect(mod.evaluate).to eq(0.to_gbs_num)
    end

    it 'evaluates a mod with result > 0' do
      mod = Mod.new(10.to_gbs_num, 3.to_gbs_num)

      expect(mod.evaluate).to eq(1.to_gbs_num)
    end

  end

  describe Pow do

    it 'returns 1 as a result if the power is 0' do
      pow_1 = Pow.new(1.to_gbs_num, 0.to_gbs_num)
      pow_42 = Pow.new(42.to_gbs_num, 0.to_gbs_num)

      expect(pow_1.evaluate).to eq(1.to_gbs_num)
      expect(pow_42.evaluate).to eq(1.to_gbs_num)
    end

    it 'evaluates 2 raised to 4' do
      pow = Pow.new(2.to_gbs_num, 4.to_gbs_num)

      expect(pow.evaluate).to eq(16.to_gbs_num)
    end

  end
end
