require 'gobstones/lang/literals/literal'
require 'gobstones/runner/gbs_type_error'

module Gobstones

  module Lang

    class Color < Literal

      def self.order
        [Azul, Negro, Rojo, Verde]
      end

      def <(other)
        self.class.order.index(self.class) < self.class.order.index(other.class)
      end

      def opposite
        raise GbsTypeError, "colors don't have opposite"
      end

      def return_type
        :Color
      end

    end

    class Azul < Color

      def previous
        Verde.new
      end

      def next
        Negro.new
      end

      def to_s
        'Azul'
      end

    end

    class Negro < Color

      def previous
        Azul.new
      end

      def next
        Rojo.new
      end

      def to_s
        'Negro'
      end

    end

    class Rojo < Color

      def previous
        Negro.new
      end

      def next
        Verde.new
      end

      def to_s
        'Rojo'
      end

    end

    class Verde < Color

      def previous
        Rojo.new
      end

      def next
        Azul.new
      end

      def to_s
        'Verde'
      end

    end

  end

end
