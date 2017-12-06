require 'gobstones/lang/expressions/one_arg_expression'
require 'gobstones/lang/commands/sacar'
require 'gobstones/runner/errors/gobstones_type_error'

module Gobstones
  module Lang
    module Commands
      class Poner < OneArgExpression
        def evaluate(context)
          with_evaluated_argument_in(context) do |result|
            context.head.put result
          end
        rescue RuntimeError => e
          raise Gobstones::Runner::GobstonesTypeError, e.message
        end

        def undo(context)
          # TODO maybe the command should use the original context
          # instead of this one (when it was executed)
          with_evaluated_argument_in(context) do |result|
            context.head.take_out result
          end
        end

        def opposite
          Sacar.new(argument)
        end
      end
    end
  end
end
