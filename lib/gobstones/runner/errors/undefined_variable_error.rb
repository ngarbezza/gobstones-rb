module Gobstones
  module Runner
    class UndefinedVariableError < StandardError

      def self.for(variable_name)
        self.new(undefined_variable_message_for(variable_name))
      end

      def self.undefined_variable_message_for(variable_name)
        "Undefined variable: #{variable_name}"
      end

    end
  end
end
