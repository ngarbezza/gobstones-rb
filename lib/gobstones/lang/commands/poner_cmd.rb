require 'gobstones/lang/expressions/one_arg_expression'
require 'gobstones/lang/commands/sacar_cmd'
require 'gobstones/runner/gbs_type_error'

module Gobstones

  module Lang

    class Poner < OneArgExpression

      def evaluate(context)
        context.head.put arg.evaluate(context)
      rescue RuntimeError => e
        raise Gobstones::Runner::GbsTypeError, e.message
      end

      def undo(context)
        # TODO maybe the command should use the original context
        # instead of this one (when it was executed)
        context.head.take_out arg.evaluate(context)
      end

      def opposite
        Sacar.new arg
      end

    end

  end

end
