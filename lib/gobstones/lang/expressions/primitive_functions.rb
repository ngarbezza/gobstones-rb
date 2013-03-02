require 'gobstones/lang/expressions/one_arg_expression'
require 'gobstones/type_check_result'

module Gobstones

  module Lang

    class NroBolitas < OneArgExpression

    end

    class HayBolitas < OneArgExpression

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
