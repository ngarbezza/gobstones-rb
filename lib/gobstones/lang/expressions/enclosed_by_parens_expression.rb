require 'gobstones/lang/expressions/one_arg_expression'

module Gobstones

  module Lang

    class EnclosedByParensExpression < OneArgExpression

      def evaluate(context)
        with_evaluated_argument_in(context) { |result| result }
      end

    end

  end

end
