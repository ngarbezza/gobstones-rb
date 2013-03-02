require 'gobstones/lang/expressions/two_arg_expression'
require 'gobstones/lang/literals/number'
require 'gobstones/runner/gbs_runtime_error'

module Gobstones

  module Lang

    class Add < TwoArgExpression

      evaluates_with :+

    end

    class Sub < TwoArgExpression

      evaluates_with :-

    end

    class Mul < TwoArgExpression

      evaluates_with :*

    end

    class Div < TwoArgExpression

      def evaluate
        begin
          left_expr.evaluate / right_expr.evaluate
        rescue ZeroDivisionError
          raise GbsRuntimeError, "zero division"
        end
      end

    end

    class Mod < TwoArgExpression

      evaluates_with :%

    end

    class Pow < TwoArgExpression

      evaluates_with :**

    end

  end

end
