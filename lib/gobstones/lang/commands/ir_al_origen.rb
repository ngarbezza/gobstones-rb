require 'gobstones/modules/equality_definition'

module Gobstones
  module Lang
    module Commands
      class IrAlOrigen
        include EqualityDefinition

        def evaluate(context)
          context.head.go_to_origin
        end
      end
    end
  end
end
