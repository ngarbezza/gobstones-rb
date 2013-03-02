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

      def evaluate(context)
        context.head.can_move?(arg.evaluate(context)).to_gbs_bool
      end

      def arg_type
        :Direction
      end

      def type_check
        Gobstones::TypeCheckResult.new arg_type, arg.return_type
      end

    end

    class Siguiente < OneArgExpression

      def evaluate(context=nil)
        arg.evaluate(context).next
      end

    end

    class Previo < OneArgExpression

      def evaluate(context=nil)
        arg.evaluate(context).previous
      end

    end

    class Opuesto < OneArgExpression

      def evaluate(context=nil)
        arg.evaluate(context).opposite
      end

    end

  end

end
