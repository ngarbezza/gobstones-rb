module Gobstones

  module Directions

    class Direction

      def ==(other)
        self.class == other.class
      end

    end

    class Norte < Direction
      
    end

    class Este < Direction

    end

    class Sur < Direction

    end

    class Oeste < Direction

    end

  end

end
