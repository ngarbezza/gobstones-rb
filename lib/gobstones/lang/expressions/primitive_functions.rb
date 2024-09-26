# frozen_string_literal: true

require 'gobstones/lang/expressions/one_arg_expression'
require 'gobstones/extensions/boolean'
require 'gobstones/extensions/integer'
require 'gobstones/type_check_result'

module Gobstones
  module Lang
    class NroBolitas < OneArgExpression
      def evaluate(context)
        with_evaluated_argument_in(context) do |result|
          context.head.number_of_balls(result).to_gbs_num
        end
      end

      def to_s
        'nroBolitas() expression'
      end
    end

    class HayBolitas < OneArgExpression
      def evaluate(context)
        with_evaluated_argument_in(context) do |result|
          context.head.are_there_balls?(result).to_gbs_bool
        end
      end

      def to_s
        'hayBolitas() expression'
      end
    end

    class PuedeMover < OneArgExpression
      def evaluate(context)
        with_evaluated_argument_in(context) do |result|
          context.head.can_move?(result).to_gbs_bool
        end
      end

      def to_s
        'puedeMover() expression'
      end

      def argument_type
        :Direction
      end

      def type_check
        TypeCheckResult.new(argument_type, argument.return_type)
      end
    end

    class Siguiente < OneArgExpression
      def evaluate(context)
        with_evaluated_argument_in(context, &:next)
      end

      def to_s
        'siguiente() expression'
      end
    end

    class Previo < OneArgExpression
      def evaluate(context)
        with_evaluated_argument_in(context, &:previous)
      end

      def to_s
        'previo() expression'
      end
    end

    class Opuesto < OneArgExpression
      def evaluate(context)
        with_evaluated_argument_in(context, &:opposite)
      end

      def to_s
        'opuesto() expression'
      end
    end
  end
end
