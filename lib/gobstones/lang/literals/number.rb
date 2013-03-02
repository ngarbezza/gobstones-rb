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

      [:+, :-, :*, :/, :%].each do |selector|
        define_method selector do |other|
          self.class.new self.value.send(selector, other.value)
        end
      end

    end

  end

end
