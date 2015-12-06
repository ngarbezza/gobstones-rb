require 'gobstones/lang/expressions/one_arg_expression'
require 'gobstones/lang/expressions/two_arg_expression'

module Gobstones
  module Lang
    class Not < OneArgExpression

      def evaluate(context)
        with_evaluated_argument_in(context) { |result| result.not }
      end

      def to_s
        'Not expression'
      end

    end

    class And < TwoArgExpression

      evaluates_with :and

    end

    class Or < TwoArgExpression

      evaluates_with :or

    end
  end
end
