require 'gobstones/modules/equal_by_class'
require 'gobstones/runner/errors/definition_not_found_error'

module Gobstones
  module Lang
    module DefinitionCall
      include EqualByClass

      attr_reader :name, :arguments

      def initialize(name, arguments = [])
        @name = name
        @arguments = arguments
      end

      def ==(other)
        super && name == other.name && arguments == other.arguments
      end

      def evaluate(context)
        evaluated_arguments = arguments.map { |argument| argument.evaluate(context) }
        context.program_context.definition_named(name, ->(definition) {
          definition.evaluate context, evaluated_arguments
        }, -> { raise Runner::DefinitionNotFound, name })
      end
    end
  end
end
