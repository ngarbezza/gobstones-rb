require 'gobstones/lang/expressions/two_arg_expression'
require 'gobstones/runner/errors/gobstones_runtime_error'

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

      def evaluate(context=nil)
        begin
          left_expr.evaluate(context) / right_expr.evaluate(context)
        rescue ZeroDivisionError
          raise Gobstones::Runner::GobstonesRuntimeError, 'zero division'
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