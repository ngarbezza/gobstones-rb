require 'gobstones/modules/equal_by_class'

module Gobstones
  module Lang
    module Commands
      class VaciarTablero
        include EqualByClass

        def evaluate(context)
          context.board.empty!
        end
      end
    end
  end
end
