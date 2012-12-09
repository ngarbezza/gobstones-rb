module Gobstones

  module Functions
  
    class OneArgFunction

      attr_reader :arg

      def initialize(arg)
        @arg = arg
      end

      def ==(other)
        self.class == other.class && arg == other.arg
      end

    end

    class NroBolitas < OneArgFunction

    end

  end

end
