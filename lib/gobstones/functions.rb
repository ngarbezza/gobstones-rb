require_relative 'type_check_result'

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

    class HayBolitas < OneArgFunction

    end

    class PuedeMover < OneArgFunction

      def arg_type
        :Direction
      end

      def type_check
        Gobstones::TypeCheckResult.new arg_type, arg.return_type
      end

    end

    class Siguiente < OneArgFunction

    end

    class Previo < OneArgFunction

    end

    class Opuesto < OneArgFunction

    end

  end

end
