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
        function_call_result = expression.evaluate(context)
        var_tuple.variables.each_with_index do |variable, index|
          context.set variable, function_call_result[index]
        end
      end

    end

  end

end
