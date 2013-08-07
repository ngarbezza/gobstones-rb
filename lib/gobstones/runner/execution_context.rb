module Gobstones

  module Runner

    class ExecutionContext

      def initialize
        @values = {}
      end

      def set(var_name, value)
        @values[var_name] = value
      end

      def get(var_name)
        @values[var_name] || (raise UndefinedVariableError)
      end

      def clear(var_name)
        @values.delete(var_name)
      end

      def has_variable_named?(name)
        @values.keys.any? { |var| var.name == name }
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
        found_definition = @program.definitions.find { |definition|
          definition.named? name
        }
        if found_definition
          found_block.call found_definition
        else
          not_found_block.call
        end
      end

    end

  end

end
