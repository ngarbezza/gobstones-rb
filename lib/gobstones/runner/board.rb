require 'gobstones/runner/out_of_board_error'

module Gobstones

  module Runner

    class Board

      attr_reader :rows, :columns

      def initialize(r, c)
        @rows, @columns = r, c
        @matrix = [[Cell.new] * c] * r
      end

      def cell_at(x, y)
        raise OutOfBoardError unless \
          x.between?(0, rows - 1) && y.between?(0, columns - 1)

        @matrix[x][y]
      end

      def each_cell
        @matrix.each do |row|
          row.each do |cell|
            yield cell
          end
        end
      end

      def put(x, y, color)
        cell_at(x, y).put(color)
      end

      def take_out(x, y, color)
        cell_at(x, y).take_out(color)
      end

      def are_there_balls?(x, y, color)
        cell_at(x, y).are_there_balls?(color)
      end

      def number_of_balls(x, y, color)
        cell_at(x, y).number_of_balls(color)
      end

      def empty!
        each_cell { |cell| cell.empty! }
      end

    end

  end

end
