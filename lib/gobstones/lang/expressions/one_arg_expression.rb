require 'gobstones/modules/equal_by_class'

module Gobstones

  module Lang

    class OneArgExpression

      include Gobstones::EqualByClass

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

      def is_function_call?
        false
      end

    end

  end

end
