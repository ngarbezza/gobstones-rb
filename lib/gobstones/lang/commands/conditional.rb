require 'gobstones/modules/equal_by_class'

module Gobstones
  module Lang
    module Commands
      class Conditional
        include EqualByClass

        attr_reader :condition, :then_block

        def initialize(condition, then_block)
          @condition = condition
          @then_block = then_block
        end

        def ==(other)
          super &&
            condition == other.condition &&
            then_block == other.then_block
        end

        def evaluate_condition(context)
          condition.evaluate(context)
        end
      end
    end
  end
end
