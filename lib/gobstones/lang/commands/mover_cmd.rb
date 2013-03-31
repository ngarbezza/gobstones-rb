require 'gobstones/lang/expressions/one_arg_expression'

module Gobstones

  module Lang

    class Mover < OneArgExpression

      def evaluate(context)
        context.head.move arg.evaluate(context)
      end

      def undo(context)
        opposite.evaluate context
      end

      def opposite
        Mover.new arg.opposite
      end

    end

  end

end
