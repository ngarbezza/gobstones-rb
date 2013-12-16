require 'gobstones/modules/equal_by_class'

module Gobstones

  module Lang

    module DefinitionCall

      include Gobstones::EqualByClass

      attr_reader :name, :args

      def initialize(name, args=[])
        @name = name
        @args = args
      end

      def ==(other)
        super(other) &&
        self.name == other.name &&
        self.args == other.args
      end

    end

  end

end
