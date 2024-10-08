# frozen_string_literal: true

require 'gobstones/lang/definitions/definition'
require 'gobstones/runner/execution_context'
require 'gobstones/lang/definitions/return_from_function'

module Gobstones
  module Lang
    class Function < Definition
      def definition_type
        'function'
      end

      def create_context_based_on(outer_context)
        Runner::FunctionExecutionContext.based_on(outer_context)
      end
    end
  end
end
