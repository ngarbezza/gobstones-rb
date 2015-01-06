require 'gobstones/modules/equal_by_class'

module Gobstones

  module Lang

    class MultipleAssignment

      include Gobstones::EqualByClass

      attr_reader :var_tuple, :expression

      def initialize(var_tuple, expression)
        @var_tuple, @expression = var_tuple, expression
      end

      def ==(other)
        super(other) &&
        self.var_tuple == other.var_tuple &&
        self.expression == other.expression
      end

      def evaluate(context)
        raise 'not implemented yet'
      end

    end

  end

end
