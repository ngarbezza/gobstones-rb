require 'gobstones/lang/literals/literal'

module Gobstones

  module Lang

    class Color < Literal

      def ==(other)
        self.class == other.class
      end

      def return_type
        :Color
      end

    end

    class Azul < Color

    end

    class Negro < Color

    end

    class Rojo < Color

    end

    class Verde < Color

    end

  end

end
