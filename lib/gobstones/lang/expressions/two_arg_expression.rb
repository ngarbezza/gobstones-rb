module Gobstones

  module Lang

    module TwoArgExpression

      attr_reader :left_expr, :right_expr

      def initialize(left, right)
        @left_expr = left
        @right_expr = right
      end

      def ==(other)
        self.class == other.class &&
          self.left_expr == other.left_expr &&
          self.right_expr == other.right_expr
      end

    end

  end

end
