require 'gobstones/modules/equal_by_class'

module Gobstones
  module Lang
    module Commands
      class IrAlOrigen

        include Gobstones::EqualByClass

        def evaluate(context)
          context.head.go_to_origin
        end

      end
    end
  end
end
