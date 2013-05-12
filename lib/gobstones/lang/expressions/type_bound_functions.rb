module Gobstones

  module Lang

    class TypeBoundFunc

      def ==(other)
        self.class == other.class
      end

    end

    class MinBool < TypeBoundFunc

      def evaluate(context=nil)
        False.new
      end

    end

    class MaxBool < TypeBoundFunc

      def evaluate(context=nil)
        True.new
      end

    end

    class MinColor < TypeBoundFunc

      def evaluate(context=nil)
        Azul.new
      end

    end

    class MaxColor < TypeBoundFunc

      def evaluate(context=nil)
        Verde.new
      end

    end

    class MinDir < TypeBoundFunc

      def evaluate(context=nil)
        Norte.new
      end

    end

    class MaxDir < TypeBoundFunc

      def evaluate(context=nil)
        Oeste.new
      end

    end

  end

end
