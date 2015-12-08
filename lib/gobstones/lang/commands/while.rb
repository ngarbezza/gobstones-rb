require 'gobstones/lang/commands/conditional'
require 'gobstones/runner/errors/gobstones_runtime_error'

module Gobstones
  module Lang
    module Commands
      class While < Conditional

        STACK_LIMIT = 10000

        def evaluate(context)
          stack_acc = 0
          while evaluate_condition(context).is_true?
            raise Gobstones::Runner::GobstonesRuntimeError, 'stack overflow' if stack_acc == STACK_LIMIT
            then_block.evaluate context
            stack_acc += 1
          end
        end

      end
    end
  end
end
