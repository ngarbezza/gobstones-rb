require 'gobstones/runner/head'
require 'gobstones/runner/undefined_variable_error'

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

    end

  end

end
