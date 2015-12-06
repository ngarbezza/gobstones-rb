require 'gobstones/lang/expressions/one_arg_expression'
require 'gobstones/lang/commands/poner_cmd'
require 'gobstones/runner/errors/gobstones_type_error'

module Gobstones
  module Lang
    class Sacar < OneArgExpression

      def evaluate(context)
        with_evaluated_argument_in(context) do |result|
          context.head.take_out result
        end
      rescue RuntimeError => e
        raise Gobstones::Runner::GobstonesTypeError, e.message
      end

      def undo(context)
        with_evaluated_argument_in(context) do |result|
          context.head.put result
        end
      end

      def opposite
        Poner.new(argument)
      end

    end
  end
end
