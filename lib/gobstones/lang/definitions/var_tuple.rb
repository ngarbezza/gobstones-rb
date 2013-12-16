require 'gobstones/modules/equal_by_class'

module Gobstones

  module Lang

    class VarTuple

      include Gobstones::EqualByClass

      attr_reader :variables

      def initialize(variables)
        @variables = variables
      end

      def ==(other)
        super(other) &&
        self.variables == other.variables
      end

      def length
        variables.length
      end

    end

  end

end
