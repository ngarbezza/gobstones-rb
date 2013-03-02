require 'gobstones/lang/expressions/two_arg_expression'

module Gobstones

  module Lang

    class Equal < TwoArgExpression

      evaluates_with :equal

    end

    class NotEqual < TwoArgExpression

      evaluates_with :not_equal

    end

    class LessThan < TwoArgExpression

      evaluates_with :less_than

    end

    class LessEqual < TwoArgExpression

    end

    class GreaterEqual < TwoArgExpression

    end

    class GreaterThan < TwoArgExpression

    end

  end

end
