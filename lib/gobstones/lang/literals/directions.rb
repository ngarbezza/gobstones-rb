require 'gobstones/lang/literals/literal'

module Gobstones

  module Lang

    class Direction < Literal

      def self.order
        [Norte, Este, Sur, Oeste]
      end

      def <(other)
        self.class.order.index(self.class) < self.class.order.index(other.class)
      end

      def return_type
        :Direction
      end

    end

    class Norte < Direction

      def can_move?(head)
        head.can_move_north?
      end

      def move(head)
        head.move_north
      end

      def opposite
        Sur.new
      end

      def previous
        Oeste.new
      end

      def next
        Este.new
      end

    end

    class Este < Direction

      def can_move?(head)
        head.can_move_east?
      end

      def move(head)
        head.move_east
      end

      def opposite
        Oeste.new
      end

      def previous
        Norte.new
      end

      def next
        Sur.new
      end

    end

    class Sur < Direction

      def can_move?(head)
        head.can_move_south?
      end

      def move(head)
        head.move_south
      end

      def opposite
        Norte.new
      end

      def previous
        Este.new
      end

      def next
        Oeste.new
      end

    end

    class Oeste < Direction

      def can_move?(head)
        head.can_move_west?
      end

      def move(head)
        head.move_west
      end

      def opposite
        Este.new
      end

      def previous
        Sur.new
      end

      def next
        Norte.new
      end

    end

  end

end
