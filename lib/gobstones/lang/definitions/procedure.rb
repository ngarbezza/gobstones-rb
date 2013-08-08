require 'gobstones/lang/definitions/definition'
require 'gobstones/lang/definitions/no_return'
require 'gobstones/runner/execution_context'

module Gobstones

  module Lang

    class Procedure < Definition

      # TODO rename args to a better name, args_tuple?

      def initialize(name, args, body)
        super(name, args, body, NoReturn.new)
      end

      def evaluate(context, arguments=[])
        check_number_of_arguments arguments
        procedure_context = Gobstones::Runner::ProcedureExecutionContext.based_on context
        set_arguments arguments, procedure_context
        body.evaluate procedure_context
      end

      private

      def check_number_of_arguments(arguments)
        if args.length != arguments.length
          message = "Wrong number of arguments in procedure '#{name}': expected #{args.length}, got #{arguments.length}"
          raise WrongArgumentsError, message
        end
      end

      def set_arguments(arguments, procedure_context)
        args.length.times do |index|
          procedure_context.set args.variables[index], arguments[index]
        end
      end

    end

  end

end
