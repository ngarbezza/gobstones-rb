describe Gobstones::Parser, "boolean expressions" do

  describe "relational operators" do

    let(:a) { Expressions::VarName.new 'a' }
    let(:b) { Expressions::VarName.new 'b' }
    let(:c) { Expressions::VarName.new 'c' }
    let(:d) { Expressions::VarName.new 'd' }

    it "should parse an expression with ==" do
      eq = Expressions::Equal.new a, b

      'a==b'.should be_parsed_to eq
      'a  == b'.should be_parsed_to eq
    end

    it "should parse an expression with /=" do
      not_eq = Expressions::NotEqual.new a, b

      'a/=b'.should be_parsed_to not_eq
      'a /=   b'.should be_parsed_to not_eq
    end

    it "should parse an expression with <" do
      lt = Expressions::LessThan.new a, b

      'a<b'.should be_parsed_to lt
      'a  <  b'.should be_parsed_to lt
    end

    it "should parse an expression with <=" do
      le = Expressions::LessEqual.new a, b

      'a<=b'.should be_parsed_to le
      'a  <= b'.should be_parsed_to le
    end
    
    it "should parse an expression with >=" do
      ge = Expressions::GreaterEqual.new a, b

      'a>=b'.should be_parsed_to ge
      'a >=  b'.should be_parsed_to ge
    end

    it "should parse an expression with >" do
      gt = Expressions::GreaterThan.new a, b

      'a>b'.should be_parsed_to gt
      'a  > b'.should be_parsed_to gt
    end

  end

end
