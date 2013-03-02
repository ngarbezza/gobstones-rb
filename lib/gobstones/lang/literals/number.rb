module Gobstones

  module Lang

    class Number

      attr_reader :value

      def initialize(num)
        @value = num
      end

      def == other
        self.class == other.class && self.value == other.value
      end

      def return_type
        :Number
      end

      def evaluate
        self
      end

      def + other
        self.class.new self.value + other.value
      end

      def - other
        self.class.new self.value - other.value
      end

      def * other
        self.class.new self.value * other.value
      end

      def / other
        self.class.new self.value / other.value
      end

      def % other
        self.class.new self.value % other.value
      end

    end

  end

end
