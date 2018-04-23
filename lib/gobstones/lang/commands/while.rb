require 'gobstones/lang/commands/conditional'
require 'gobstones/runner/errors/gobstones_runtime_error'

module Gobstones
  module Lang
    module Commands
      class While < Conditional
        STACK_LIMIT = 10_000

        def evaluate(context, stack_size = 0)
          raise Runner::GobstonesRuntimeError, 'stack overflow' if stack_size == STACK_LIMIT
          return unless evaluate_condition(context).true?
          then_block.evaluate(context)
          evaluate(context, stack_size + 1)
        end
      end
    end
  end
end
