require 'gobstones/modules/equal_by_class'

module Gobstones
  module Lang
    class IrAlOrigen

      include Gobstones::EqualByClass

      def evaluate(context)
        context.head.go_to_origin
      end

    end
  end
end
