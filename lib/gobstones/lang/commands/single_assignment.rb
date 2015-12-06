require 'gobstones/modules/equal_by_class'

module Gobstones
  module Lang
    class SingleAssignment

      include Gobstones::EqualByClass

      attr_reader :var_name, :expression

      def initialize(var_name, expression)
        @var_name, @expression = var_name, expression
      end

      def ==(other)
        super(other) &&
        self.var_name == other.var_name &&
        self.expression == other.expression
      end

      def evaluate(context)
        context.set var_name, expression.evaluate(context)
      end

    end
  end
end
