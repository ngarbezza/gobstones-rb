describe Gobstones::Parser, "arithmetic expressions" do

  let(:a) { Expressions::VarName.new 'a' }
  let(:b) { Expressions::VarName.new 'b' }
  let(:c) { Expressions::VarName.new 'c' }
  let(:d) { Expressions::VarName.new 'd' }

  describe "addition and subtraction" do

    it "should parse a + expression" do
      sum = Expressions::Add.new a, b

      'a+b'.should be_parsed_to sum
      'a +  b'.should be_parsed_to sum
    end

    it "should parse a nested + expression, associating to left" do
      sum_ab = Expressions::Add.new a, b
      total = Expressions::Add.new sum_ab, c

      'a + b + c'.should be_parsed_to total
    end

    it "should parse a - expression" do
      sum = Expressions::Sub.new a, b

      'a-b'.should be_parsed_to sum
      'a -  b'.should be_parsed_to sum
    end

    it "should parse a nested expression with + and -, associating to left" do
      sum_ab = Expressions::Add.new a, b
      total = Expressions::Sub.new sum_ab, c

      'a + b - c'.should be_parsed_to total
    end

  end

  describe "multiplication, division, modulus and power" do

    it "should parse a * expression" do
      mul = Expressions::Mul.new a, b

      'a*b'.should be_parsed_to mul
      'a   * b'.should be_parsed_to mul
    end

    it "should parse a nested * expression" do
      mul_ab = Expressions::Mul.new a, b
      total = Expressions::Mul.new mul_ab, c

      'a * b * c'.should be_parsed_to total
    end

    it "should parse a div expression" do
      div = Expressions::Div.new a, b

      'a div b'.should be_parsed_to div
      'a   div  b'.should be_parsed_to div
    end

    it "should parse a mod expression" do
      mod = Expressions::Mod.new a, b

      'a mod b'.should be_parsed_to mod
      'a  mod   b'.should be_parsed_to mod
    end

    it "should parse a power expression" do
      pow = Expressions::Pow.new a, b

      'a^b'.should be_parsed_to pow
      'a ^  b'.should be_parsed_to pow
    end

    it "should parse a nested power expression, associating left" do
      pow_ab = Expressions::Pow.new a, b
      pow_abc = Expressions::Pow.new pow_ab, c
      pow_abcd = Expressions::Pow.new pow_abc, d

      'a ^ b ^ c ^ d'.should be_parsed_to pow_abcd
    end

  end

  describe "complex arithmetic expressions (without parentheses)" do

    it "should parse using precedence of + and - over *" do
      mul = Expressions::Mul.new b, c
      sub = Expressions::Sub.new a, mul
      add = Expressions::Add.new sub, d

      'a - b * c + d'.should be_parsed_to add
    end

    it "should parse using precedence of * over div and mod" do
      div = Expressions::Div.new a, b
      mod = Expressions::Mod.new a, c
      inner_mul = Expressions::Mul.new div, mod
      outer_mul = Expressions::Mul.new inner_mul, d

      'a div b * a mod c * d'.should be_parsed_to outer_mul
    end

    it "should parse using precedence of div and mod over ^" do
      pow_ab = Expressions::Pow.new a, b
      pow_cd = Expressions::Pow.new c, d
      div = Expressions::Div.new pow_ab, pow_cd

      'a^b div c^d'.should be_parsed_to div
    end

    it "should parse an expression with all kind of operators" do
      pow = Expressions::Pow.new b, c
      mod = Expressions::Mod.new a, pow
      div = Expressions::Div.new d, b
      mul = Expressions::Mul.new a, div
      add = Expressions::Add.new mod, mul
      sub = Expressions::Sub.new add, c

      'a mod b ^ c + a * d div b - c'.should be_parsed_to sub
    end

  end

end
