module Gobstones

  module Lang

    class SimpleAssignment

      attr_reader :var_name, :exp

      def initialize(var_name, exp)
        @var_name, @exp = var_name, exp
      end

      def ==(other)
        self.class == other.class &&
        self.var_name == other.var_name &&
        self.exp == other.exp
      end

    end

  end

end
