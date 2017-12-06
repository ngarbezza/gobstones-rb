require 'gobstones/lang/expressions/one_arg_expression'

module Gobstones
  module Lang
    module Commands
      class Mover < OneArgExpression
        def evaluate(context)
          with_evaluated_argument_in(context) do |result|
            context.head.move result
          end
        end

        def undo(context)
          opposite.evaluate context
        end

        def opposite
          Mover.new(argument.opposite)
        end
      end
    end
  end
end
