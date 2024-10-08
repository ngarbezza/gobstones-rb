# frozen_string_literal: true

require 'gobstones/runner/errors/empty_cell_error'

module Gobstones
  module Runner
    class Cell
      def initialize
        @values = Color.all.to_h { |color| [color, 0] }
      end

      def put(color)
        check(color)
        lookup(color) { |value| value + 1 }
      end

      def take_out(color)
        check(color)
        raise EmptyCellError unless are_there_balls?(color)

        lookup(color) { |value| value - 1 }
      end

      def are_there_balls?(color)
        check(color)
        number_of_balls(color).positive?
      end

      def number_of_balls(color)
        check(color)
        lookup(color)
      end

      def empty!
        initialize
      end

      def empty?
        @values.values.all?(&:zero?)
      end

      def clone
        self.class.new.tap do |copy|
          Color.all.map(&:new).each do |color|
            number_of_balls(color).times { copy.put(color) }
          end
        end
      end

      private

      def check(color)
        raise "'#{color}' is not a color" unless Color.all.include?(color.class)
      end

      def lookup(color)
        value = @values.keys.detect { |col| col == color.class }
        if block_given?
          @values[value] = yield @values[value]
        else
          @values[value]
        end
      end
    end
  end
end
