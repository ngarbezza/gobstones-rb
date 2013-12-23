require 'gobstones/lang/definitions/definition'
require 'gobstones/lang/definitions/no_return_statement'
require 'gobstones/runner/execution_context'

module Gobstones

  module Lang

    class Procedure < Definition

      # TODO rename args to a better name, args_tuple?

      def initialize(name, args, body)
        super(name, args, body, NoReturnStatement.new)
      end

      def definition_type
        'procedure'
      end

      def create_context_based_on(outer_context)
        Gobstones::Runner::ProcedureExecutionContext.based_on outer_context
      end

    end

  end

end
