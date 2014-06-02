require 'gobstones/modules/equal_by_class'

module Gobstones

  module Lang

    class Skip

      include Gobstones::EqualByClass

      def evaluate(context)
        # do nothing, that's my job :-)
      end

    end

  end

end
