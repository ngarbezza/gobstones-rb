module Gobstones

  module Lang

    class Direction

      def ==(other)
        self.class == other.class
      end

      def return_type
        :Direction
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
