module Gobstones

  module Runner

    class Cell

      def initialize
        @values = { Azul => 0, Negro => 0, Rojo => 0, Verde => 0 }
      end

      def put(color)
        check color
        lookup(color) { |value| value + 1 }
      end

      def take_out(color)
        check color
        raise EmptyCellError unless are_there_balls?(color)
        lookup(color) { |value| value - 1 }
      end

      def are_there_balls?(color)
        check color
        number_of_balls(color) > 0
      end

      def number_of_balls(color)
        check color
        lookup color
      end

      def empty!
        initialize
      end

      def empty?
        @values.values.all? { |value| value.zero? }
      end

      def clone
        self.class.new.tap do |copy|
          [Azul.new, Negro.new, Rojo.new, Verde.new].each do |color|
            number_of_balls(color).times do
              copy.put color
            end
          end
        end
      end

      private

      def check(color)
        raise "'#{color}' is not a color" \
        unless [Azul, Negro, Rojo, Verde].include? color.class
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
