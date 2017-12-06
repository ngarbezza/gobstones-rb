require 'gobstones/modules/equal_by_class'

module Gobstones
  module Lang
    class ReturnFromMain
      include EqualByClass

      attr_reader :var_tuple

      def initialize(var_tuple)
        @var_tuple = var_tuple
      end

      def ==(other)
        super(other) &&
          var_tuple == other.var_tuple
      end

      def evaluate(context)
        Hash[evaluated_variables(context)]
      end

      private

      def evaluated_variables(context)
        var_tuple.variables.map do |variable|
          [variable, context.get(variable)]
        end
      end
    end
  end
end
