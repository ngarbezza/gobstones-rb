module Gobstones

  module Lang

    class ReturnFromMain

      attr_reader :var_tuple

      def initialize(var_tuple)
        @var_tuple = var_tuple
      end

      def ==(other)
        self.class == other.class &&
        self.var_tuple == other.var_tuple
      end

    end

  end

end
