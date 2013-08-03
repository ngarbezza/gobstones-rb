require 'gobstones/runner/execution_context'

module Gobstones

  module Lang

    class Program

      attr_reader :definitions, :main_definition

      def initialize(definitions, main_definition)
        @definitions = definitions
        @main_definition = main_definition
      end

      def ==(other)
        self.class == other.class &&
        self.definitions == other.definitions &&
        self.main_definition == other.main_definition
      end

      def evaluate
        context = Gobstones::Runner::ExecutionContext.for self
        main_definition.evaluate context
      end

    end

  end

end
