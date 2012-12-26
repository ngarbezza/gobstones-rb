require 'gobstones/lang/expressions/two_arg_expression'

module Gobstones

  module Lang

    class Equal

      include TwoArgExpression

    end

    class NotEqual

      include TwoArgExpression

    end

    class LessThan

      include TwoArgExpression

    end

    class LessEqual

      include TwoArgExpression

    end

    class GreaterEqual

      include TwoArgExpression

    end

    class GreaterThan

      include TwoArgExpression

    end

  end

end
