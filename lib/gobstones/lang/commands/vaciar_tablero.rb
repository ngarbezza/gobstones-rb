require 'gobstones/modules/equality_definition'

module Gobstones
  module Lang
    module Commands
      class VaciarTablero
        include EqualityDefinition

        def evaluate(context)
          context.board.empty!
        end
      end
    end
  end
end
