# frozen_string_literal: true

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
        with_execution_context do |context|
          return_values = main_definition.evaluate(context)
          Runner::ProgramResult.new(context.head, return_values)
        end
      end

      private

      def with_execution_context
        yield create_context
      end

      def create_context
        Runner::ExecutionContext.for_program(self)
      end
    end
  end
end
