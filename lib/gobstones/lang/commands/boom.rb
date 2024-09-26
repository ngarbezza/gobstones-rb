# frozen_string_literal: true

require 'gobstones/runner/errors/boom_error'
require 'gobstones/modules/equality_definition'

module Gobstones
  module Lang
    module Commands
      class Boom
        include EqualityDefinition

        attr_reader :message

        def initialize(message)
          @message = message
        end

        def equality_attributes
          %i[message]
        end

        def evaluate(_context)
          raise Runner::BoomError, message
        end
      end
    end
  end
end
