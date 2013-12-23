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
        super(other) && self.expressions == other.expressions
      end

      def evaluate(context)
        # TODO return a Tuple of expressions if there is more than one
        expressions.first.evaluate context
      end

    end

  end

end
