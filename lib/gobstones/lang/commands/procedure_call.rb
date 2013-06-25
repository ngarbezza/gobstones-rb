require 'gobstones/lang/definitions/definition_call'

module Gobstones

  module Lang

    class ProcCall

      include DefinitionCall

      def evaluate(context)
        context.definition_named(name, ->(definition) {
          definition.evaluate context
        }, -> { nil } )
      end

    end

  end

end
