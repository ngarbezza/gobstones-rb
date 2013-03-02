require 'gobstones/lang/expressions/one_arg_expression'

module Gobstones

  module Lang

    class Not < OneArgExpression

      def evaluate
        arg.evaluate.not
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
