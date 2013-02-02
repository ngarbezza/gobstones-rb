describe Gobstones::Parser, "arithmetic expressions" do

  let(:a) { VarName.new 'a' }
  let(:b) { VarName.new 'b' }
  let(:c) { VarName.new 'c' }
  let(:d) { VarName.new 'd' }

  describe "addition and subtraction" do

    it "should parse a + expression" do
      sum = Add.new a, b

      'a+b'.should be_parsed_as(:expression).and_return(sum)
      'a +  b'.should be_parsed_as(:expression).and_return(sum)
    end

    it "should parse a nested + expression, associating to left" do
      sum_ab = Add.new a, b
      total = Add.new sum_ab, c

      'a + b + c'.should be_parsed_as(:expression).and_return(total)
    end

    it "should parse a - expression" do
      sub = Sub.new a, b

      'a-b'.should be_parsed_as(:expression).and_return(sub)
      'a -  b'.should be_parsed_as(:expression).and_return(sub)
    end

    it "should parse a nested expression with + and -, associating to left" do
      sum_ab = Add.new a, b
      total = Sub.new sum_ab, c

      'a + b - c'.should be_parsed_as(:expression).and_return(total)
    end

  end

  describe "multiplication, division, modulus and power" do

    it "should parse a * expression" do
      mul = Mul.new a, b

      'a*b'.should be_parsed_as(:expression).and_return(mul)
      'a   * b'.should be_parsed_as(:expression).and_return(mul)
    end

    it "should parse a nested * expression" do
      mul_ab = Mul.new a, b
      total = Mul.new mul_ab, c

      'a * b * c'.should be_parsed_as(:expression).and_return(total)
    end

    it "should parse a div expression" do
      div = Div.new a, b

      'a div b'.should be_parsed_as(:expression).and_return(div)
      'a   div  b'.should be_parsed_as(:expression).and_return(div)
    end

    it "should parse a mod expression" do
      mod = Mod.new a, b

      'a mod b'.should be_parsed_as(:expression).and_return(mod)
      'a  mod   b'.should be_parsed_as(:expression).and_return(mod)
    end

    it "should parse a power expression" do
      pow = Pow.new a, b

      'a^b'.should be_parsed_as(:expression).and_return(pow)
      'a ^  b'.should be_parsed_as(:expression).and_return(pow)
    end

    it "should parse a nested power expression, associating left" do
      pow_ab = Pow.new a, b
      pow_abc = Pow.new pow_ab, c
      pow_abcd = Pow.new pow_abc, d

      'a ^ b ^ c ^ d'.should be_parsed_as(:expression).and_return(pow_abcd)
    end

  end

  describe "complex arithmetic expressions (without parentheses)" do

    it "should parse using precedence of + and - over *" do
      mul = Mul.new b, c
      sub = Sub.new a, mul
      add = Add.new sub, d

      'a - b * c + d'.should be_parsed_as(:expression).and_return(add)
    end

    it "should parse using precedence of * over div and mod" do
      div = Div.new a, b
      mod = Mod.new a, c
      inner_mul = Mul.new div, mod
      outer_mul = Mul.new inner_mul, d

      'a div b * a mod c * d'.
        should be_parsed_as(:expression).and_return(outer_mul)
    end

    it "should parse using precedence of div and mod over ^" do
      pow_ab = Pow.new a, b
      pow_cd = Pow.new c, d
      div = Div.new pow_ab, pow_cd

      'a^b div c^d'.should be_parsed_as(:expression).and_return(div)
    end

    it "should parse an expression with all kind of operators" do
      pow = Pow.new b, c
      mod = Mod.new a, pow
      div = Div.new d, b
      mul = Mul.new a, div
      add = Add.new mod, mul
      sub = Sub.new add, c

      'a mod b ^ c + a * d div b - c'.
        should be_parsed_as(:expression).and_return(sub)
    end

  end

end
