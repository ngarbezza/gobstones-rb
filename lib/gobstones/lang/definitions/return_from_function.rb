require 'gobstones/modules/equal_by_class'

module Gobstones
  module Lang
    class ReturnFromFunction
      include Gobstones::EqualByClass

      attr_reader :expressions

      def initialize(expressions)
        @expressions = expressions
      end

      def ==(other)
        super(other) && expressions == other.expressions
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
