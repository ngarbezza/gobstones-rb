module Gobstones

  module Lang

    class ReturnFromFunction

      attr_reader :expressions

      def initialize(expressions)
        @expressions = expressions
      end

      def ==(other)
        self.class == other.class &&
        self.expressions == other.expressions
      end

    end

  end

end
