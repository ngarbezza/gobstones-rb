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

        def ==(other)
          super(other) && self.else_block == other.else_block
        end

        def evaluate(context)
          cond = evaluate_condition(context)
          cond.if_true then_block, context
          cond.if_false else_block, context
        end

      end
    end
  end
end
