module Gobstones

  module Lang

    class Literal

      include Comparable

      def evaluate
        self
      end

      def equal(other)
        (self == other).to_gbs_bool
      end

      def <=>(other)
        self == other ? 0 : (self < other ? -1 : 1)
      end

      def ==(other)
        self.class == other.class # default behavior
      end

      def <(other)
        raise 'subclass responsibility'
      end

    end

  end

end
