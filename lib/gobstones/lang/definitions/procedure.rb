require 'gobstones/lang/definitions/definition'
require 'gobstones/lang/definitions/no_return'

module Gobstones

  module Lang

    class Procedure < Definition

      def initialize(name, args, body)
        super(name, args, body, NoReturn.new)
      end

      def evaluate(context, arguments=[])
        procedure_context = ProcedureExecutionContext.based_on context
        # TODO create new context and set variables
        # args.variables.length.times { |i| context.set args.variables[i], arguments[i] }
        body.evaluate procedure_context
      end

    end

  end

end
