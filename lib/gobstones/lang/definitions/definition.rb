require 'gobstones/modules/equal_by_class'

module Gobstones

  module Lang

    class Definition

      include Gobstones::EqualByClass

      attr_reader :name, :args, :body, :return_statement

      def initialize(name, args, body, return_statement)
        @name = name
        @args = args
        @body = body
        @return_statement = return_statement
      end

      def ==(other)
        super(other) &&
        self.name == other.name &&
        self.args == other.args &&
        self.body == other.body &&
        self.return_statement == other.return_statement
      end

      def named?(a_name)
        name == a_name
      end

      def evaluate(context, arguments=[])
        check_number_of_arguments arguments
        in_definition_context_based_on(context) do |definition_context|
          set_arguments arguments, definition_context
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

      def check_number_of_arguments(arguments)
        raise Gobstones::Runner::WrongArgumentsError, wrong_number_of_arguments_message(arguments) if args.length != arguments.length
      end

      def wrong_number_of_arguments_message(arguments)
        "Wrong number of arguments in #{definition_type} '#{name}': expected #{args.length}, got #{arguments.length}"
      end

      def in_definition_context_based_on(outer_context, &block)
        yield create_context_based_on(outer_context)
      end

      def set_arguments(arguments, procedure_context)
        args.length.times do |index|
          procedure_context.set args.variables[index], arguments[index]
        end
      end
    end

  end

end
