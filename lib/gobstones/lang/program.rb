require 'gobstones/modules/equality_definition'
require 'gobstones/runner/execution_context'
require 'gobstones/runner/program_result'

module Gobstones
  module Lang
    class Program
      include EqualityDefinition

      attr_reader :definitions, :main_definition

      def initialize(definitions, main_definition)
        @definitions = definitions
        @main_definition = main_definition
      end

      def equality_attributes
        %i[definitions main_definition]
      end

      def evaluate
        context = create_context
        return_values = main_definition.evaluate(context)
        Runner::ProgramResult.new(context.head, return_values)
      end

      private

      def create_context
        Runner::ProgramExecutionContext.for(self)
      end
    end
  end
end
