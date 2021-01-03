module Gobstones
  module Runner
    class DefinitionNotFound < StandardError
      # TODO indicate if it is coming from a procedure or function

      def initialize(definition_name)
        super()
        @definition_name = definition_name
      end

      def message
        self.class.message_for(@definition_name)
      end

      def self.message_for(definition_name)
        "definition named '#{definition_name}' not found in program"
      end
    end
  end
end
