require 'gobstones/modules/equal_by_class'

module Gobstones
  module Lang
    module Commands
      class Skip
        include EqualByClass

        def evaluate(context)
          # do nothing, that's my job :-)
        end
      end
    end
  end
end
