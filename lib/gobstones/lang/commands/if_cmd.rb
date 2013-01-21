module Gobstones

  module Lang

    class IfCmd

      attr_reader :condition, :then_block

      def initialize(condition, then_block)
        @condition, @block = condition, then_block
      end

      def ==(other)
        self.class == other.class &&
        self.condition == other.condition &&
        self.then_block == other.then_block
      end

    end

  end

end
