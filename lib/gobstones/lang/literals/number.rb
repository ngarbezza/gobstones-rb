module Gobstones

  module Lang

    class Number

      attr_reader :value

      def initialize(num)
        @value = num
      end

      def == other
        self.class == other.class &&
          self.value == other.value
      end

      def return_type
        :Number
      end

    end

  end

end
