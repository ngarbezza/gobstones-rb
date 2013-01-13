require 'gobstones/runner/empty_cell_error'

module Gobstones

  module Runner

    class Cell

      def initialize
        @values = { Azul => 0, Negro => 0, Rojo => 0, Verde => 0 }
      end

      def put(color)
        check(color)
        @values[color] += 1
      end

      def take_out(color)
        check(color)
        raise EmptyCellError unless are_there_balls?(color)
        @values[color] -= 1
      end

      def are_there_balls?(color)
        check(color)
        @values[color] > 0
      end

      def number_of_balls(color)
        check(color)
        @values[color]
      end

      def empty!
        initialize
      end

      private

      def check(color)
        raise "'#{color}' is not a color" \
        unless [Azul, Negro, Rojo, Verde].include? color
      end

    end

  end

end
