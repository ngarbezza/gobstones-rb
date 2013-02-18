require 'gobstones/lang/expressions/two_arg_expression'
require 'gobstones/lang/literals/number'

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

    end

    class Mul

      include TwoArgExpression

    end

    class Div

      include TwoArgExpression

    end

    class Mod

      include TwoArgExpression

    end

    class Pow

      include TwoArgExpression

    end

  end

end
