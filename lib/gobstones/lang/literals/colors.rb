require 'gobstones/lang/literals/literal'

module Gobstones

  module Lang

    class Color < Literal

      def self.order
        [Azul, Negro, Rojo, Verde]
      end

      def <(other)
        self.class.order.index(self.class) < self.class.order.index(other.class)
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
