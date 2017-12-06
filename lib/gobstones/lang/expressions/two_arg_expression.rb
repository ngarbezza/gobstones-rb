require 'gobstones/lang/expressions/expression'

module Gobstones
  module Lang
    class TwoArgExpression < Expression
      attr_reader :left_expr, :right_expr

      def self.evaluates_with(selector)
        instance_eval do
          define_method :evaluate do |*args|
            context = args.first
            left_expr.evaluate(context).send(selector, right_expr.evaluate(context))
          end

          define_method :to_s do
            "#{selector} expression"
          end
        end
      end

      def initialize(left, right)
        @left_expr = left
        @right_expr = right
      end

      def ==(other)
        super(other) &&
          left_expr == other.left_expr &&
          right_expr == other.right_expr
      end
    end
  end
end
