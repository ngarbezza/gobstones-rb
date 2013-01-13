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

    end

  end

end
