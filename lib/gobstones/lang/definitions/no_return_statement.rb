require 'gobstones/modules/equal_by_class'

module Gobstones
  module Lang
    class NoReturnStatement

      include Gobstones::EqualByClass

      def evaluate(context)
        # nothing to do
      end

    end
  end
end
