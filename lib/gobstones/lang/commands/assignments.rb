module Gobstones

  module Lang

    class SingleAssignment

      attr_reader :var_name, :expression

      def initialize(var_name, expression)
        @var_name, @expression = var_name, expression
      end

      def ==(other)
        self.class == other.class &&
        self.var_name == other.var_name &&
        self.expression == other.expression
      end

      def evaluate(context)
        context.set var_name, expression.evaluate(context)
      end

    end

    # TODO implement multiple assignment

  end

end
