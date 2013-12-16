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
        super(other) &&
        self.expressions == other.expressions
      end

    end

  end

end
