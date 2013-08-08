require 'gobstones/lang/definitions/definition'
require 'gobstones/lang/definitions/no_return'

module Gobstones

  module Lang

    class Procedure < Definition

      def initialize(name, args, body)
        super(name, args, body, NoReturn.new)
      end

      def evaluate(context, arguments=[])
        check_number_of_arguments arguments
        procedure_context = ProcedureExecutionContext.based_on context
        # TODO create new context and set variables
        # args.variables.length.times { |i| context.set args.variables[i], arguments[i] }
        body.evaluate procedure_context
      end

      private

      def check_number_of_arguments(arguments)
        if args.length != arguments.length
          message = "Wrong number of arguments in procedure '#{name}': expected #{args.length}, got #{arguments.length}"
          raise WrongArgumentsError, message
        end
      end

    end

  end

end
