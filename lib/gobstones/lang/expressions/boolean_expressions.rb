require 'gobstones/lang/expressions/one_arg_expression'

module Gobstones

  module Lang

    class Not

      include OneArgExpression

    end

    class And

      include TwoArgExpression

    end

    class Or

      include TwoArgExpression

    end

  end

end
