require 'gobstones/runner/boom_error'

module Gobstones

  module Lang

    class Boom

      attr_reader :message

      def initialize(message)
        @message = message
      end

      def ==(other)
        self.class == other.class &&
        self.message == other.message
      end

      def evaluate(context=nil)
        raise Gobstones::Runner::BoomError, message
      end

    end

  end

end
