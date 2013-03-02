module Gobstones

  module Lang

    class Literal

      def evaluate
        self
      end

      def equal(other)
        (self == other).to_gbs_bool
      end

    end

  end

end
