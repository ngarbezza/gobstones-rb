module Gobstones

  module Lang

    class VarTuple

      attr_reader :variables

      def initialize(variables)
        @variables = variables
      end

      def ==(other)
        self.class == other.class &&
        self.variables == other.variables
      end

    end

  end

end