require 'gobstones/lang/expressions/two_arg_expression'

module Gobstones

  module Lang

    class Equal

      include TwoArgExpression

      def evaluate
        left_expr.evaluate.equal right_expr.evaluate
      end

    end

    class NotEqual

      include TwoArgExpression

      def evaluate
        left_expr.evaluate.not_equal right_expr.evaluate
      end

    end

    class LessThan

      include TwoArgExpression

    end

    class LessEqual

      include TwoArgExpression

    end

    class GreaterEqual

      include TwoArgExpression

    end

    class GreaterThan

      include TwoArgExpression

    end

  end

end
