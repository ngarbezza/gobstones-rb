require 'gobstones/runner/execution_context'
require 'gobstones/modules/equal_by_class'

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
        create_context.tap do |context|
          main_definition.evaluate context
        end
      end

      private

      def create_context
        Gobstones::Runner::ProgramExecutionContext.for self
      end

    end

  end

end
