require 'gobstones/modules/equal_by_class'
require 'gobstones/runner/execution_context'
require 'gobstones/runner/program_result'

module Gobstones
  module Lang
    class Program

      include Gobstones::EqualByClass

      attr_reader :definitions, :main_definition

      def initialize(definitions, main_definition)
        @definitions = definitions
        @main_definition = main_definition
      end

      def ==(other)
        super(other) &&
        self.definitions == other.definitions &&
        self.main_definition == other.main_definition
      end

      def evaluate
        context = create_context
        return_values = main_definition.evaluate(context)
        Gobstones::Runner::ProgramResult.new(context.head, return_values)
      end

      private

      def create_context
        Gobstones::Runner::ProgramExecutionContext.for(self)
      end

    end
  end
end
