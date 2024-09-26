# frozen_string_literal: true

require 'gobstones/modules/equality_definition'

module Gobstones
  module Lang
    module Commands
      class Skip
        include EqualityDefinition

        def evaluate(_context)
          # do nothing, that's my job :-)
        end
      end
    end
  end
end
