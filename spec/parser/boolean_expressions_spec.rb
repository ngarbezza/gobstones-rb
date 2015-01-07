describe Gobstones::Parser, "boolean expressions" do

  let(:a) { 'a'.to_var_name }
  let(:b) { 'b'.to_var_name }
  let(:c) { 'c'.to_var_name }
  let(:d) { 'd'.to_var_name }

  describe "relational operators" do

    it "parses an expression with ==" do
      eq = Equal.new a, b

      expect('a==b').to be_parsed_as(:expression).and_return(eq)
      expect('a  == b').to be_parsed_as(:expression).and_return(eq)
    end

    it "parses an expression with /=" do
      not_eq = NotEqual.new a, b

      expect('a/=b').to be_parsed_as(:expression).and_return(not_eq)
      expect('a /=   b').to be_parsed_as(:expression).and_return(not_eq)
    end

    it "parses an expression with <" do
      lt = LessThan.new a, b

      expect('a<b').to be_parsed_as(:expression).and_return(lt)
      expect('a  <  b').to be_parsed_as(:expression).and_return(lt)
    end

    it "parses an expression with <=" do
      le = LessEqual.new a, b

      expect('a<=b').to be_parsed_as(:expression).and_return(le)
      expect('a  <= b').to be_parsed_as(:expression).and_return(le)
    end

    it "parses an expression with >=" do
      ge = GreaterEqual.new a, b

      expect('a>=b').to be_parsed_as(:expression).and_return(ge)
      expect('a >=  b').to be_parsed_as(:expression).and_return(ge)
    end

    it "parses an expression with >" do
      gt = GreaterThan.new a, b

      expect('a>b').to be_parsed_as(:expression).and_return(gt)
      expect('a  > b').to be_parsed_as(:expression).and_return(gt)
    end

  end

  describe "not, and, or" do

    it "parses a not expression" do
      exp = Equal.new a, b
      not_exp = Not.new exp

      expect('not a == b').to be_parsed_as(:expression).and_return(not_exp)
    end

    it "parses an And expression" do
      exp = And.new a, b

      expect('a&&b').to be_parsed_as(:expression).and_return(exp)
      expect('a &&  b').to be_parsed_as(:expression).and_return(exp)
    end

    it "parses an Or expression" do
      exp = Or.new a, b

      expect('a||b').to be_parsed_as(:expression).and_return(exp)
      expect('a   || b').to be_parsed_as(:expression).and_return(exp)
    end

    describe "nested" do

      it "parses a nested || expression, associating right" do
        inner_or = Or.new b, c
        outer_or = Or.new a, inner_or

        expect('a || b || c').to be_parsed_as(:expression).and_return(outer_or)
      end

      it "parses a nested && expression, associating right" do
        inner_and = And.new b, c
        outer_and = And.new a, inner_and

        expect('a && b && c').to be_parsed_as(:expression).and_return(outer_and)
      end

      it "parses with || taking precedence over &&, left" do
        bc_and = And.new b, c
        abc_or = Or.new a, bc_and

        expect('a || b && c').to be_parsed_as(:expression).and_return(abc_or)
      end

      it "parses with || taking precedence over &&, right" do
        ab_and = And.new a, b
        abc_or = Or.new ab_and, c

        expect('a && b || c').to be_parsed_as(:expression).and_return(abc_or)
      end

    end

  end

end
