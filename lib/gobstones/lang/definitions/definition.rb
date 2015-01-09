require 'gobstones/modules/equal_by_class'

module Gobstones

  module Lang

    class Definition

      include Gobstones::EqualByClass

      attr_reader :name, :arguments, :body, :return_statement

      def initialize(name, arguments, body, return_statement)
        @name = name
        @arguments = arguments
        @body = body
        @return_statement = return_statement
      end

      def ==(other)
        super(other) &&
        self.name == other.name &&
        self.arguments == other.arguments &&
        self.body == other.body &&
        self.return_statement == other.return_statement
      end

      def named?(a_name)
        name == a_name
      end

      def evaluate(context, calling_arguments=[])
        check_number_of_arguments calling_arguments
        in_definition_context_based_on(context) do |definition_context|
          set_arguments calling_arguments, definition_context
          body.evaluate definition_context
          return return_statement.evaluate definition_context
        end
      end

      def create_context_based_on(outer_context)
        raise 'subclass responsibility'
      end

      def definition_type
        raise 'subclass responsibility'
      end

      private

      def check_number_of_arguments(calling_arguments)
        raise Gobstones::Runner::WrongArgumentsError, wrong_number_of_arguments_message(calling_arguments) if
            arguments.length != calling_arguments.length
      end

      def wrong_number_of_arguments_message(calling_arguments)
        "Wrong number of arguments in #{definition_type} '#{name}':" +
            " expected #{arguments.length}, got #{calling_arguments.length}"
      end

      def in_definition_context_based_on(outer_context, &block)
        yield create_context_based_on(outer_context)
      end

      def set_arguments(calling_arguments, procedure_context)
        arguments.length.times do |index|
          procedure_context.set arguments.variables[index], calling_arguments[index]
        end
      end
    end

  end

end
