require 'gobstones/modules/equality_definition'
require 'gobstones/runner/errors/definition_not_found_error'

module Gobstones
  module Lang
    module DefinitionCall
      include EqualityDefinition

      attr_reader :name, :arguments

      def initialize(name, arguments = [])
        @name = name
        @arguments = arguments
      end

      def equality_attributes
        %i[name arguments]
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
