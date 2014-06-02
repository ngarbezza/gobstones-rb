module Gobstones

  module Runner

    class DefinitionNotFound < StandardError

      def self.new(definition_name)
        super(message_for(definition_name))
      end

      def self.message_for(definition_name)
        "definition named '#{definition_name}' not found in program"
      end

    end

  end

end
