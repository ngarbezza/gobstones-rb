require 'gobstones/lang/expressions/one_arg_expression'
require 'gobstones/lang/commands/sacar_cmd'
require 'gobstones/runner/gbs_type_error'

module Gobstones

  module Lang

    class Poner < OneArgExpression

      def evaluate(context)
        begin
          context.head.put arg
        rescue RuntimeError => e
          raise GbsTypeError, e.message
        end
      end

      def undo(context)
        context.head.take_out arg
      end

      def opposite
        Sacar.new arg
      end

    end

  end

end
