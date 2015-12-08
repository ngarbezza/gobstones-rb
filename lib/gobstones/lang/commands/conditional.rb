require 'gobstones/modules/equal_by_class'

module Gobstones
  module Lang
    module Commands
      class Conditional

        include Gobstones::EqualByClass

        attr_reader :condition, :then_block

        def initialize(condition, then_block)
          @condition, @then_block = condition, then_block
        end

        def ==(other)
          super(other) &&
          self.condition == other.condition &&
          self.then_block == other.then_block
        end

        def evaluate_condition(context)
          condition.evaluate(context)
        end

      end
    end
  end
end
