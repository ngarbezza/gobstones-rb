require 'gobstones/lang/literals/literal'

module Gobstones

  module Lang

    class Number < Literal

      attr_reader :value

      def initialize(num)
        @value = num
      end

      def == other
        super(other) && self.value == other.value
      end

      def <(other)
        self.value < other.value
      end

      def return_type
        :Number
      end

      [:+, :-, :*, :/, :%, :**].each do |selector|
        define_method selector do |other|
          self.class.new self.value.send(selector, other.value)
        end
      end

    end

  end

end
