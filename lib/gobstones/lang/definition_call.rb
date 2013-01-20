module Gobstones

  module Lang

    module DefinitionCall

      attr_reader :name, :args

      def initialize(name, args=[])
        @name = name
        @args = args
      end

      def ==(other)
        self.class == other.class &&
        self.name == other.name &&
        self.args == other.args
      end

    end
  end
end
