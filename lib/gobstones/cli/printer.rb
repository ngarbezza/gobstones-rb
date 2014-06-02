require 'gobstones/lang/literals/colors'

module Gobstones

  module CLI

    class Printer

      TEMPLATE = File.read(File.dirname(__FILE__) + '/board_template')

      def initialize(context)
        @context = context
        @board = TEMPLATE
      end

      def print
        highlight_current_cell
        put_ball_values
        puts @board
      end

      private

      def highlight_current_cell
        char = 'X'
        x = @context.head.x_pos
        y = @context.head.y_pos
        highlight_row x, y, char
        highlight_row x, y - 1, char
        highlight_column x, y, char
        highlight_column x + 1, y, char
      end

      def put_ball_values
        total_rows.times do |x|
          total_columns.times do |y|
            put_ball_value @context.board.number_of_balls(x, y, Gobstones::Lang::Negro.new), 'N', x, y, 2, 1
            put_ball_value @context.board.number_of_balls(x, y, Gobstones::Lang::Azul.new) , 'A', x, y, 6, 1
            put_ball_value @context.board.number_of_balls(x, y, Gobstones::Lang::Verde.new), 'V', x, y, 2, 3
            put_ball_value @context.board.number_of_balls(x, y, Gobstones::Lang::Rojo.new) , 'R', x, y, 6, 3
          end
        end
      end

      def put_ball_value(number, char, x, y, x_offset, y_offset)
        unless number.zero?
          corner = cell_top_left_corner x, y
          pos = corner + (y_offset * line_length) + x_offset
          if number < 10
            @board[pos] = ' '
            @board[pos+1] = number.to_s
          else
            @board[pos] = number.to_s[0]
            @board[pos+1] = number.to_s[1]
          end
          @board[pos+2] = char
        end
      end

      def highlight_row(x, y, char)
        corner = cell_top_left_corner x, y
        (cell_width - 1).times do |index|
          @board[corner + index + 1] = char
        end
      end

      def highlight_column(x, y, char)
        corner = cell_top_left_corner x, y
        (cell_height - 1).times do |index|
          @board[corner + ((index + 1) * line_length)] = char
        end
      end

      def line_length
        98
      end

      def cell_height
        4
      end

      def cell_width
        10
      end

      def cell_top_left_corner(x, y)
        head_lines = 1
        head_chars = 4
        y_to_go = (total_columns - 1 - y) * cell_height + head_lines
        x_to_go = x * cell_width + head_chars
        (y_to_go * line_length) + x_to_go
      end

      def total_columns
        9
      end

      def total_rows
        9
      end

    end

  end

end
