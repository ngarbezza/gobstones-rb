require 'gobstones/lang/expressions/expression'
require 'gobstones/lang/literals/booleans'
require 'gobstones/lang/literals/colors'
require 'gobstones/lang/literals/directions'

module Gobstones

  module Lang

    class TypeBoundFunc < Expression

    end

    class MinBool < TypeBoundFunc

      def evaluate(context=nil)
        False.new
      end

      def to_s
        'minBool() expression'
      end

    end

    class MaxBool < TypeBoundFunc

      def evaluate(context=nil)
        True.new
      end

      def to_s
        'maxBool() expression'
      end

    end

    class MinColor < TypeBoundFunc

      def evaluate(context=nil)
        Azul.new
      end

      def to_s
        'minColor() expression'
      end

    end

    class MaxColor < TypeBoundFunc

      def evaluate(context=nil)
        Verde.new
      end

      def to_s
        'maxColor() expression'
      end

    end

    class MinDir < TypeBoundFunc

      def evaluate(context=nil)
        Norte.new
      end

      def to_s
        'minDir() expression'
      end

    end

    class MaxDir < TypeBoundFunc

      def evaluate(context=nil)
        Oeste.new
      end

      def to_s
        'maxDir() expression'
      end

    end

  end

end
