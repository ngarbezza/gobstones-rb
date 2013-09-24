require 'gobstones/runner/cell'

module Gobstones

  module Runner

    class Board

      attr_reader :rows, :columns

      def initialize(r, c)
        @rows, @columns = r, c
        @matrix = []
        r.times { @matrix << []; c.times { @matrix.last << Cell.new } }
      end

      def cell_at(x, y)
        raise OutOfBoardError unless \
          x.between?(0, rows - 1) && y.between?(0, columns - 1)

        @matrix[x][y]
      end

      def each_cell
        @matrix.each { |row| row.each { |cell| yield cell } }
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

      def empty?
        each_cell { |cell| return false unless cell.empty? }
        true
      end

    end

  end

end