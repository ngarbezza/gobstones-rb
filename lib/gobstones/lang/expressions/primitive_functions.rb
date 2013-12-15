require 'gobstones/lang/expressions/one_arg_expression'
require 'gobstones/extensions/boolean'
require 'gobstones/extensions/fixnum'
require 'gobstones/type_check_result'

module Gobstones

  module Lang

    class NroBolitas < OneArgExpression

      def evaluate(context)
        with_evaluated_argument_in(context) do |result|
          context.head.number_of_balls(result).to_gbs_num
        end
      end

    end

    class HayBolitas < OneArgExpression

      def evaluate(context)
        with_evaluated_argument_in(context) do |result|
          context.head.are_there_balls?(result).to_gbs_bool
        end
      end

    end

    class PuedeMover < OneArgExpression

      def evaluate(context)
        with_evaluated_argument_in(context) do |result|
          context.head.can_move?(result).to_gbs_bool
        end
      end

      def argument_type
        :Direction
      end

      def type_check
        Gobstones::TypeCheckResult.new argument_type, argument.return_type
      end

    end

    class Siguiente < OneArgExpression

      def evaluate(context)
        with_evaluated_argument_in(context) { |result| result.next }
      end

    end

    class Previo < OneArgExpression

      def evaluate(context)
        with_evaluated_argument_in(context) { |result| result.previous }
      end

    end

    class Opuesto < OneArgExpression

      def evaluate(context)
        with_evaluated_argument_in(context) { |result| result.opposite }
      end

    end

  end

end
