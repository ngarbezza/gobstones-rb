require 'gobstones/lang/definitions/definition'
require 'gobstones/runner/execution_context'

module Gobstones

  module Lang

    class Function < Definition

      def definition_type
        'function'
      end

      def create_context_based_on(outer_context)
        Gobstones::Runner::FunctionExecutionContext.based_on outer_context
      end

    end

  end

end
