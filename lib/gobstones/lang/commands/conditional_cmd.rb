module Gobstones

  module Lang

    class ConditionalCmd

      attr_reader :condition, :then_block

      def initialize(condition, then_block)
        @condition, @then_block = condition, then_block
      end

      def ==(other)
        self.class == other.class &&
        self.condition == other.condition &&
        self.then_block == other.then_block
      end

      def evaluate_condition(context)
        condition.evaluate context
      end

    end

  end

end
