require 'gobstones/lang/definitions/definition_call'

module Gobstones

  module Lang

    class ProcCall

      include DefinitionCall

      def evaluate(context)
        evaluated_args = args.map { |arg| arg.evaluate context }
        context.program_context.definition_named(name, ->(definition) {
          definition.evaluate context, evaluated_args
        }, -> { nil } )
      end

    end

  end

end
