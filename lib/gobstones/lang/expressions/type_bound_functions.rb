module Gobstones

  module Lang

    class TypeBoundFunc

      def ==(other)
        self.class == other.class
      end

    end

    class MinBool < TypeBoundFunc

    end

    class MaxBool < TypeBoundFunc

    end

    class MinColor < TypeBoundFunc

    end

    class MaxColor < TypeBoundFunc

    end

    class MinDir < TypeBoundFunc

    end

    class MaxDir < TypeBoundFunc

    end

  end

end
