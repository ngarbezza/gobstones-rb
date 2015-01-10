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
        # TODO implement as many simple assignments?
        function_call_result = expression.evaluate(context)
        function_call_result.length.times do |index|
          context.set var_tuple.variable_at(index), function_call_result[index]
        end
      end

    end

  end

end
