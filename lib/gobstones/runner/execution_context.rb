require 'gobstones/runner/head'
require 'gobstones/runner/errors/undefined_variable_error'
require 'error_handling_protocol'

module Gobstones

  module Runner

    class ExecutionContext

      def initialize
        @values = {}
      end

      def set(variable_name, value)
        @values[variable_name] = value
      end

      def get(variable_name)
        @values[variable_name] || undefined_variable_error(variable_name)
      end

      def clear(variable_name)
        @values.delete(variable_name)
      end

      def has_variable_named?(name)
        @values.keys.any? { |variable| variable.named? name }
      end

      def program_context
        subclass_responsibility
      end

      protected

      def undefined_variable_error(variable_name)
        raise UndefinedVariableError.for(variable_name)
      end

    end

    class ProgramExecutionContext < ExecutionContext

      attr_reader :head

      def self.for(program)
        self.new program
      end

      def initialize(program)
        super()
        @head = Head.new
        @program = program
      end

      def definition_named(name, found_block, not_found_block)
        if_none = proc { return not_found_block.call }
        found_definition = @program.definitions.detect(if_none) \
          { |definition| definition.named? name }
        found_block.call found_definition
      end

      def program_context
        self
      end

      def board
        head.board
      end

    end

    class ProcedureExecutionContext < ExecutionContext

      def self.based_on(outer_context)
        new outer_context
      end

      def initialize(outer_context)
        super()
        @outer_context = outer_context
      end

      def head
        @outer_context.head
      end

      def program_context
        @outer_context.program_context
      end

    end

    class FunctionExecutionContext < ExecutionContext

      attr_reader :head

      def self.based_on(outer_context)
        new outer_context
      end

      def initialize(outer_context)
        super()
        @outer_context = outer_context
        @head = outer_context.head.clone
      end

      def program_context
        @outer_context.program_context
      end

    end

    class NullExecutionContext < ExecutionContext

      def set(variable_name, value)

      end

      def get(variable_name)
        undefined_variable_error(variable_name)
      end

      def clear(variable_name)

      end

      def has_variable_named?(variable_name)
        false
      end

      def program_context
        raise 'a null execution does not know its program context'
      end

    end

  end

end
