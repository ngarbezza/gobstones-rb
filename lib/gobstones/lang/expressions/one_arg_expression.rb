require 'gobstones/lang/expressions/expression'

module Gobstones

  module Lang

    class OneArgExpression < Expression

      attr_reader :argument

      def initialize(argument)
        @argument = argument
      end

      def ==(other)
        super(other) && argument == other.argument
      end

      def evaluate(context)
        raise 'subclass responsibility'
      end

      def with_evaluated_argument_in(context, &block)
        yield argument.evaluate(context)
      end

    end

  end

end
