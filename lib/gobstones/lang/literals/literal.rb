module Gobstones

  module Lang

    class Literal

      include Comparable

      def evaluate
        self
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

      def equal(other)
        (self == other).to_gbs_bool
      end

      def not_equal(other)
        (self != other).to_gbs_bool
      end

      def less_than(other)
        (self < other).to_gbs_bool
      end

    end

  end

end
