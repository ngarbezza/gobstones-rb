module Gobstones

  module Colors
    
    class Color

      def ==(other)
        self.class == other.class
      end

    end

    class Azul < Color

    end

    class Negro < Color

    end

    class Rojo < Color

    end

    class Verde < Color

    end

  end

end
