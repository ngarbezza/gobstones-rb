require 'gobstones/lang/definitions/definition_call'

module Gobstones

  module Lang

    class FunctionCall

      include DefinitionCall

      def is_function_call?
        true
      end

    end

  end

end
