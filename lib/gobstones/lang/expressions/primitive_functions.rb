require 'gobstones/lang/expressions/one_arg_expression'
require 'gobstones/type_check_result'

module Gobstones

  module Lang

    class NroBolitas

      include OneArgExpression

    end

    class HayBolitas

      include OneArgExpression

    end

    class PuedeMover

      include OneArgExpression

      def arg_type
        :Direction
      end

      def type_check
        Gobstones::TypeCheckResult.new arg_type, arg.return_type
      end

    end

    class Siguiente

      include OneArgExpression

    end

    class Previo

      include OneArgExpression

    end

    class Opuesto

      include OneArgExpression

    end

  end

end
