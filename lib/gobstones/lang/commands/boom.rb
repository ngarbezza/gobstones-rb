require 'gobstones/runner/errors/boom_error'
require 'gobstones/modules/equal_by_class'

module Gobstones
  module Lang
    module Commands
      class Boom

        include Gobstones::EqualByClass

        attr_reader :message

        def initialize(message)
          @message = message
        end

        def ==(other)
          super(other) && self.message == other.message
        end

        def evaluate(context)
          raise Gobstones::Runner::BoomError, message
        end

      end
    end
  end
end
