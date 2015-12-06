require 'gobstones/lang/expressions/expression'
require 'gobstones/lang/definitions/definition_call'

module Gobstones
  module Lang
    class FunctionCall < Expression

      include DefinitionCall

      def is_function_call?
        true
      end

      def to_s
        "function call to #{name}"
      end

    end
  end
end
