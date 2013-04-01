require 'gobstones/lang/commands/conditional_cmd'

module Gobstones

  module Lang

    class WhileCmd < ConditionalCmd

      STACK_LIMIT = 10000

      def evaluate(context)
        stack_acc = 0
        while evaluate_condition(context).is_true?
          raise GbsRuntimeError, "stack overflow" if stack_acc == STACK_LIMIT
          then_block.evaluate context
          stack_acc += 1
        end
      end

    end

  end

end
