# frozen_string_literal: true

require 'gobstones/lang/commands/if'

module Gobstones
  module Lang
    module Commands
      class IfThenElse < If
        attr_reader :else_block

        def initialize(condition, then_block, else_block)
          super(condition, then_block)
          @else_block = else_block
        end

        def equality_attributes
          super + [:else_block]
        end

        def evaluate(context)
          evaluate_condition(context).
            if_true(then_block, context).
            if_false(else_block, context)
        end
      end
    end
  end
end
