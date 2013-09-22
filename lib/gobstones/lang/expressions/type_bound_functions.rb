require 'gobstones/lang/literals/booleans'
require 'gobstones/lang/literals/colors'
require 'gobstones/lang/literals/directions'
require 'gobstones/modules/equal_by_class'

module Gobstones

  module Lang

    class TypeBoundFunc

      include Gobstones::EqualByClass

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