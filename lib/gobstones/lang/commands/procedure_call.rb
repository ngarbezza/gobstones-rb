require 'gobstones/lang/definitions/definition_call'

module Gobstones
  module Lang
    class ProcedureCall

      include DefinitionCall

      def to_s
        "procedure call to #{name}"
      end

    end
  end
end
