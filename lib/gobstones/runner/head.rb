require 'gobstones/runner/board'
require 'gobstones/runner/errors/out_of_board_error'

module Gobstones
  module Runner
    class Head
      MAX_ROWS = 9
      MAX_COLS = 9

      attr_reader :board, :x_pos, :y_pos

      def self.at_random
        new.at_random
      end

      def self.with_position_and_board(x_pos, y_pos, board)
        new.with_position_and_board(x_pos, y_pos, board)
      end

      def initialize
        with_position_and_board(0, 0, Board.new(MAX_ROWS, MAX_COLS))
      end

      def at_random
        @x_pos = rand(MAX_ROWS)
        @y_pos = rand(MAX_COLS)
        self
      end

      def with_position_and_board(x_pos, y_pos, board)
        @x_pos = x_pos
        @y_pos = y_pos
        @board = board
        self
      end

      def can_move?(dir)
        check dir
        dir.can_move?(self)
      end

      def can_move_north?
        @y_pos < MAX_COLS - 1
      end

      def can_move_south?
        @y_pos > 0
      end

      def can_move_east?
        @x_pos < MAX_ROWS - 1
      end

      def can_move_west?
        @x_pos > 0
      end

      def move(dir)
        raise OutOfBoardError unless can_move?(dir)
        dir.move self
      end

      def move_north
        @y_pos += 1
      end

      def move_south
        @y_pos -= 1
      end

      def move_east
        @x_pos += 1
      end

      def move_west
        @x_pos -= 1
      end

      def go_to_origin
        @x_pos = 0
        @y_pos = 0
      end

      def put(color)
        @board.put x_pos, y_pos, color
      end

      def take_out(color)
        @board.take_out x_pos, y_pos, color
      end

      def number_of_balls(color)
        @board.number_of_balls(x_pos, y_pos, color)
      end

      def are_there_balls?(color)
        @board.are_there_balls?(x_pos, y_pos, color)
      end

      def clone
        self.class.with_position_and_board(x_pos, y_pos, board.clone)
      end

      private

      def check(dir)
        raise GobstonesTypeError, "#{dir} is not a direction" unless [Norte, Sur, Este, Oeste].include?(dir.class)
      end
    end
  end
end
