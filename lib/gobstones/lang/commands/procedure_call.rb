require 'gobstones/lang/definitions/definition_call'

module Gobstones
  module Lang
    module Commands
      class ProcedureCall
        include Gobstones::Lang::DefinitionCall

        def to_s
          "procedure call to #{name}"
        end
      end
    end
  end
end
