module Gobstones

  module Expressions

    class VarName

      attr_reader :name

      def initialize(name)
        @name = name
      end

      def ==(var)
        self.class == var.class && self.name == var.name
      end

    end

    module TwoArgExpression

      attr_reader :left_expr, :right_expr

      def initialize(left, right)
        @left_expr = left
        @right_expr = right
      end

      def ==(other)
        self.class == other.class &&
          self.left_expr == other.left_expr &&
          self.right_expr == other.right_expr
      end

    end

    class Add

      include Expressions::TwoArgExpression

    end

    class Sub

      include Expressions::TwoArgExpression

    end

    class Mul

      include Expressions::TwoArgExpression

    end

    class Div

      include Expressions::TwoArgExpression

    end

    class Mod

      include Expressions::TwoArgExpression

    end

    class Pow

      include Expressions::TwoArgExpression

    end

  end

end
