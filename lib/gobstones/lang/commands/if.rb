# frozen_string_literal: true

require 'gobstones/lang/commands/conditional'

module Gobstones
  module Lang
    module Commands
      class If < Conditional
        def evaluate(context)
          evaluate_condition(context).if_true(then_block, context)
        end
      end
    end
  end
end
