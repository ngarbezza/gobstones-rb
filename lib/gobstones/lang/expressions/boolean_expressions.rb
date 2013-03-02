require 'gobstones/lang/expressions/one_arg_expression'

module Gobstones

  module Lang

    class Not

      include OneArgExpression

      def evaluate
        arg.evaluate.not
      end

    end

    class And

      include TwoArgExpression

      def evaluate
        left_expr.evaluate.and right_expr.evaluate
      end

    end

    class Or

      include TwoArgExpression

      def evaluate
        left_expr.evaluate.or right_expr.evaluate
      end

    end

  end

end
