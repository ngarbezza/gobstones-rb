require 'gobstones/lang/expressions/two_arg_expression'
require 'gobstones/runner/errors/gobstones_runtime_error'
require 'gobstones/runner/execution_context'
require 'gobstones/extensions/integer'

module Gobstones
  module Lang
    class ArithmeticExpression < TwoArgExpression
      def self.numbers(first, second)
        new(first.to_gbs_num, second.to_gbs_num)
      end
    end

    class Add < ArithmeticExpression
      evaluates_with :+
    end

    class Sub < ArithmeticExpression
      evaluates_with :-
    end

    class Mul < ArithmeticExpression
      evaluates_with :*
    end

    class Div < ArithmeticExpression
      def evaluate(context)
        left_expr.evaluate(context) / right_expr.evaluate(context)
      rescue ZeroDivisionError
        raise Runner::GobstonesRuntimeError, 'zero division'
      end
    end

    class Mod < ArithmeticExpression
      evaluates_with :%
    end

    class Pow < ArithmeticExpression
      evaluates_with :**
    end
  end
end
