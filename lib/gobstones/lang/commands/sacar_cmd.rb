require 'gobstones/lang/expressions/one_arg_expression'
require 'gobstones/lang/commands/poner_cmd'
require 'gobstones/runner/gbs_type_error'

module Gobstones

  module Lang

    class Sacar

      include OneArgExpression

      def evaluate(context)
        begin
          context.head.take_out arg
        rescue RuntimeError => e
          raise GbsTypeError, e.message
        end
      end

      def undo(context)
        context.head.put arg
      end

      def opposite
        Poner.new arg
      end

    end

  end

end
