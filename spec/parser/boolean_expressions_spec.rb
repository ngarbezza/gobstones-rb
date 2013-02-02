describe Gobstones::Parser, "boolean expressions" do

  let(:a) { VarName.new 'a' }
  let(:b) { VarName.new 'b' }
  let(:c) { VarName.new 'c' }
  let(:d) { VarName.new 'd' }

  describe "relational operators" do

    it "should parse an expression with ==" do
      eq = Equal.new a, b

      'a==b'.should be_parsed_as(:expression).and_return(eq)
      'a  == b'.should be_parsed_as(:expression).and_return(eq)
    end

    it "should parse an expression with /=" do
      not_eq = NotEqual.new a, b

      'a/=b'.should be_parsed_as(:expression).and_return(not_eq)
      'a /=   b'.should be_parsed_as(:expression).and_return(not_eq)
    end

    it "should parse an expression with <" do
      lt = LessThan.new a, b

      'a<b'.should be_parsed_as(:expression).and_return(lt)
      'a  <  b'.should be_parsed_as(:expression).and_return(lt)
    end

    it "should parse an expression with <=" do
      le = LessEqual.new a, b

      'a<=b'.should be_parsed_as(:expression).and_return(le)
      'a  <= b'.should be_parsed_as(:expression).and_return(le)
    end

    it "should parse an expression with >=" do
      ge = GreaterEqual.new a, b

      'a>=b'.should be_parsed_as(:expression).and_return(ge)
      'a >=  b'.should be_parsed_as(:expression).and_return(ge)
    end

    it "should parse an expression with >" do
      gt = GreaterThan.new a, b

      'a>b'.should be_parsed_as(:expression).and_return(gt)
      'a  > b'.should be_parsed_as(:expression).and_return(gt)
    end

  end

  describe "not, and, or" do

    it "should parse a not expression" do
      exp = Equal.new a, b
      not_exp = Not.new exp

      'not a == b'.should be_parsed_as(:expression).and_return(not_exp)
    end

    it "should parse an And expression" do
      exp = And.new a, b

      'a&&b'.should be_parsed_as(:expression).and_return(exp)
      'a &&  b'.should be_parsed_as(:expression).and_return(exp)
    end

    it "should parse an Or expression" do
      exp = Or.new a, b

      'a||b'.should be_parsed_as(:expression).and_return(exp)
      'a   || b'.should be_parsed_as(:expression).and_return(exp)
    end

    describe "nested" do

      it "should parse a nested || expression, associating right" do
        inner_or = Or.new b, c
        outer_or = Or.new a, inner_or

        'a || b || c'.should be_parsed_as(:expression).and_return(outer_or)
      end

      it "should parse a nested && expression, associating right" do
        inner_and = And.new b, c
        outer_and = And.new a, inner_and

        'a && b && c'.should be_parsed_as(:expression).and_return(outer_and)
      end

      it "|| should take precedence over &&, left" do
        bc_and = And.new b, c
        abc_or = Or.new a, bc_and

        'a || b && c'.should be_parsed_as(:expression).and_return(abc_or)
      end

      it "|| should take precedence over &&, right" do
        ab_and = And.new a, b
        abc_or = Or.new ab_and, c

        'a && b || c'.should be_parsed_as(:expression).and_return(abc_or)
      end

    end

  end

end
