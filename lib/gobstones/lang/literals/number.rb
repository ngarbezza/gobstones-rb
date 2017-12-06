require 'gobstones/lang/literals/literal'

module Gobstones
  module Lang
    class Number < Literal
      attr_reader :value

      def initialize(num)
        @value = num
      end

      def ==(other)
        super(other) && value == other.value
      end

      def <(other)
        value < other.value
      end

      def return_type
        :Number
      end

      %i[+ - * / % **].each do |selector|
        define_method selector do |other|
          self.class.new(value.send(selector, other.value))
        end
      end

      def opposite
        self.class.new(-value)
      end

      def previous
        self.class.new(value - 1)
      end

      def next
        self.class.new(value + 1)
      end

      def to_s
        "number #{value}"
      end
    end
  end
end
