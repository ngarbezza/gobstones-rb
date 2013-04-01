require 'gobstones/lang/commands/conditional_cmd'

module Gobstones

  module Lang

    class WhileCmd < ConditionalCmd

      def evaluate(context)
        while evaluate_condition(context).is_true?
          then_block.evaluate context
        end
      end

    end

  end

end
