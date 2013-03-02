require 'gobstones/lang/literals/literal'

module Gobstones

  module Lang

    class Direction < Literal

      def ==(other)
        self.class == other.class
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

    end

  end

end
