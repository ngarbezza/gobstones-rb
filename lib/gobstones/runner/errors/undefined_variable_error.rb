# frozen_string_literal: true

module Gobstones
  module Runner
    class UndefinedVariableError < StandardError
      def self.for(variable_name)
        new(undefined_variable_message_for(variable_name))
      end

      def self.undefined_variable_message_for(variable_name)
        "Undefined variable: #{variable_name}"
      end
    end
  end
end
