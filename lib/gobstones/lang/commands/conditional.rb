# frozen_string_literal: true

require 'gobstones/modules/equality_definition'

module Gobstones
  module Lang
    module Commands
      class Conditional
        include EqualityDefinition

        attr_reader :condition, :then_block

        def initialize(condition, then_block)
          @condition = condition
          @then_block = then_block
        end

        def equality_attributes
          %i[condition then_block]
        end

        def evaluate_condition(context)
          condition.evaluate(context)
        end
      end
    end
  end
end
