require 'gobstones/modules/equal_by_class'

module Gobstones
  module Lang
    class VarTuple
      include Gobstones::EqualByClass

      attr_reader :variables

      def self.empty
        new([])
      end

      def initialize(variables)
        @variables = variables
      end

      def ==(other)
        super(other) &&
          variables == other.variables
      end

      def length
        variables.length
      end

      def variable_at(index)
        variables[index]
      end
    end
  end
end
