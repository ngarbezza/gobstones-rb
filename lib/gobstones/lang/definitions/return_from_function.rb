require 'gobstones/modules/equality_definition'

module Gobstones
  module Lang
    class ReturnFromFunction
      include EqualityDefinition

      attr_reader :expressions

      def initialize(expressions)
        @expressions = expressions
      end

      def equality_attributes
        %i[expressions]
      end

      def evaluate(context)
        # TODO think more the case of gexp tuple, should it be a data type instead of a plain list?
        expressions.size == 1 ?
            expressions.first.evaluate(context) :
            expressions.map { |expression| expression.evaluate(context) }
      end
    end
  end
end
