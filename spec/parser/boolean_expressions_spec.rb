describe Gobstones::Parser, "boolean expressions" do

  let(:a) { VarName.new 'a' }
  let(:b) { VarName.new 'b' }
  let(:c) { VarName.new 'c' }
  let(:d) { VarName.new 'd' }

  describe "relational operators" do

    it "should parse an expression with ==" do
      eq = Equal.new a, b

      'a==b'.should be_parsed_to eq
      'a  == b'.should be_parsed_to eq
    end

    it "should parse an expression with /=" do
      not_eq = NotEqual.new a, b

      'a/=b'.should be_parsed_to not_eq
      'a /=   b'.should be_parsed_to not_eq
    end

    it "should parse an expression with <" do
      lt = LessThan.new a, b

      'a<b'.should be_parsed_to lt
      'a  <  b'.should be_parsed_to lt
    end

    it "should parse an expression with <=" do
      le = LessEqual.new a, b

      'a<=b'.should be_parsed_to le
      'a  <= b'.should be_parsed_to le
    end

    it "should parse an expression with >=" do
      ge = GreaterEqual.new a, b

      'a>=b'.should be_parsed_to ge
      'a >=  b'.should be_parsed_to ge
    end

    it "should parse an expression with >" do
      gt = GreaterThan.new a, b

      'a>b'.should be_parsed_to gt
      'a  > b'.should be_parsed_to gt
    end

  end

  describe "not, and, or" do

    it "should parse a not expression" do
      exp = Equal.new a, b
      not_exp = Not.new exp

      'not a == b'.should be_parsed_to not_exp
    end

  end

end
