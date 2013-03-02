require 'gobstones/lang/expressions/one_arg_expression'
require 'gobstones/type_check_result'

module Gobstones

  module Lang

    class NroBolitas < OneArgExpression

      def evaluate(context)
        context.head.number_of_balls(arg.evaluate(context)).to_gbs_num
      end

    end

    class HayBolitas < OneArgExpression

      def evaluate(context)
        context.head.are_there_balls?(arg.evaluate(context)).to_gbs_bool
      end

    end

    class PuedeMover < OneArgExpression

      def arg_type
        :Direction
      end

      def type_check
        Gobstones::TypeCheckResult.new arg_type, arg.return_type
      end

    end

    class Siguiente < OneArgExpression

    end

    class Previo < OneArgExpression

    end

    class Opuesto < OneArgExpression

    end

  end

end
