module Gobstones

  module Runner

    class ExecutionContext

      attr_reader :head

      def initialize
        @head = Head.new
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

  end

end
