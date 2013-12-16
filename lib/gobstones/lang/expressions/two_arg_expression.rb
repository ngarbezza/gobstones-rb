require 'gobstones/modules/equal_by_class'

module Gobstones

  module Lang

    class TwoArgExpression

      include Gobstones::EqualByClass

      attr_reader :left_expr, :right_expr

      def self.evaluates_with(selector)
        instance_eval do
          define_method :evaluate do |*args|
            context = args.first
            left_expr.evaluate(context)
              .send(selector, right_expr.evaluate(context))
          end
        end
      end

      def initialize(left, right)
        @left_expr = left
        @right_expr = right
      end

      def ==(other)
        super(other) &&
        self.left_expr == other.left_expr &&
        self.right_expr == other.right_expr
      end

    end

  end

end
