describe Gobstones::Parser, "arithmetic expressions" do

  let(:a) { VarName.new 'a' }
  let(:b) { VarName.new 'b' }
  let(:c) { VarName.new 'c' }
  let(:d) { VarName.new 'd' }

  describe "addition and subtraction" do

    it "should parse a + expression" do
      sum = Add.new a, b

      expect('a+b').to be_parsed_as(:expression).and_return(sum)
      expect('a +  b').to be_parsed_as(:expression).and_return(sum)
    end

    it "should parse a nested + expression, associating to left" do
      sum_ab = Add.new a, b
      total = Add.new sum_ab, c

      expect('a + b + c').to be_parsed_as(:expression).and_return(total)
    end

    it "should parse a - expression" do
      sub = Sub.new a, b

      expect('a-b').to be_parsed_as(:expression).and_return(sub)
      expect('a -  b').to be_parsed_as(:expression).and_return(sub)
    end

    it "should parse a nested expression with + and -, associating to left" do
      sum_ab = Add.new a, b
      total = Sub.new sum_ab, c

      expect('a + b - c').to be_parsed_as(:expression).and_return(total)
    end

  end

  describe "multiplication, division, modulus and power" do

    it "should parse a * expression" do
      mul = Mul.new a, b

      expect('a*b').to be_parsed_as(:expression).and_return(mul)
      expect('a   * b').to be_parsed_as(:expression).and_return(mul)
    end

    it "should parse a nested * expression" do
      mul_ab = Mul.new a, b
      total = Mul.new mul_ab, c

      expect('a * b * c').to be_parsed_as(:expression).and_return(total)
    end

    it "should parse a div expression" do
      div = Div.new a, b

      expect('a div b').to be_parsed_as(:expression).and_return(div)
      expect('a   div  b').to be_parsed_as(:expression).and_return(div)
    end

    it "should parse a mod expression" do
      mod = Mod.new a, b

      expect('a mod b').to be_parsed_as(:expression).and_return(mod)
      expect('a  mod   b').to be_parsed_as(:expression).and_return(mod)
    end

    it "should parse a power expression" do
      pow = Pow.new a, b

      expect('a^b').to be_parsed_as(:expression).and_return(pow)
      expect('a ^  b').to be_parsed_as(:expression).and_return(pow)
    end

    it "should parse a nested power expression, associating left" do
      pow_ab = Pow.new a, b
      pow_abc = Pow.new pow_ab, c
      pow_abcd = Pow.new pow_abc, d

      expect('a ^ b ^ c ^ d').to be_parsed_as(:expression).and_return(pow_abcd)
    end

  end

  describe "complex arithmetic expressions (without parentheses)" do

    it "should parse using precedence of + and - over *" do
      mul = Mul.new b, c
      sub = Sub.new a, mul
      add = Add.new sub, d

      expect('a - b * c + d').to be_parsed_as(:expression).and_return(add)
    end

    it "should parse using precedence of * over div and mod" do
      div = Div.new a, b
      mod = Mod.new a, c
      inner_mul = Mul.new div, mod
      outer_mul = Mul.new inner_mul, d

      expect('a div b * a mod c * d').
        to be_parsed_as(:expression).and_return(outer_mul)
    end

    it "should parse using precedence of div and mod over ^" do
      pow_ab = Pow.new a, b
      pow_cd = Pow.new c, d
      div = Div.new pow_ab, pow_cd

      expect('a^b div c^d').to be_parsed_as(:expression).and_return(div)
    end

    it "should parse an expression with all kind of operators" do
      pow = Pow.new b, c
      mod = Mod.new a, pow
      div = Div.new d, b
      mul = Mul.new a, div
      add = Add.new mod, mul
      sub = Sub.new add, c

      expect('a mod b ^ c + a * d div b - c').
        to be_parsed_as(:expression).and_return(sub)
    end

  end

end