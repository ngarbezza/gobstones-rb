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

    # TODO implement multiple assignment

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
