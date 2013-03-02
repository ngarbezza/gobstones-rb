require 'gobstones/lang/expressions/two_arg_expression'
require 'gobstones/lang/literals/number'
require 'gobstones/runner/gbs_runtime_error'

module Gobstones

  module Lang

    class Add

      include TwoArgExpression

      def evaluate
        left_expr.evaluate + right_expr.evaluate
      end

    end

    class Sub

      include TwoArgExpression

      def evaluate
        left_expr.evaluate - right_expr.evaluate
      end

    end

    class Mul

      include TwoArgExpression

      def evaluate
        left_expr.evaluate * right_expr.evaluate
      end

    end

    class Div

      include TwoArgExpression

      def evaluate
        begin
          left_expr.evaluate / right_expr.evaluate
        rescue ZeroDivisionError
          raise GbsRuntimeError, "zero division"
        end
      end

    end

    class Mod

      include TwoArgExpression

      def evaluate
        left_expr.evaluate % right_expr.evaluate
      end

    end

    class Pow

      include TwoArgExpression

      def evaluate
        left_expr.evaluate ** right_expr.evaluate
      end

    end

  end

end
