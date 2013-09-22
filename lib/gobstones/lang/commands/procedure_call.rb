require 'gobstones/lang/definitions/definition_call'
require 'gobstones/runner/definition_not_found_error'

module Gobstones

  module Lang

    class ProcCall

      include DefinitionCall

      def evaluate(context)
        evaluated_args = args.map { |arg| arg.evaluate context }
        context.program_context.definition_named(name, ->(definition) {
          definition.evaluate context, evaluated_args
        }, -> { raise DefinitionNotFound.new name } )
      end

    end

  end

end
