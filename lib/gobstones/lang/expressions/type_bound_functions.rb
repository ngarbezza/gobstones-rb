require 'gobstones/lang/expressions/expression'
require 'gobstones/lang/literals/booleans'
require 'gobstones/lang/literals/colors'
require 'gobstones/lang/literals/directions'
require 'gobstones/runner/execution_context'

module Gobstones
  module Lang
    class TypeBoundFunc < Expression

    end

    class MinBool < TypeBoundFunc

      def evaluate(context=Gobstones::Runner::NullExecutionContext.new)
        False.new
      end

      def to_s
        'minBool() expression'
      end

    end

    class MaxBool < TypeBoundFunc

      def evaluate(context=Gobstones::Runner::NullExecutionContext.new)
        True.new
      end

      def to_s
        'maxBool() expression'
      end

    end

    class MinColor < TypeBoundFunc

      def evaluate(context=Gobstones::Runner::NullExecutionContext.new)
        Azul.new
      end

      def to_s
        'minColor() expression'
      end

    end

    class MaxColor < TypeBoundFunc

      def evaluate(context=Gobstones::Runner::NullExecutionContext.new)
        Verde.new
      end

      def to_s
        'maxColor() expression'
      end

    end

    class MinDir < TypeBoundFunc

      def evaluate(context=Gobstones::Runner::NullExecutionContext.new)
        Norte.new
      end

      def to_s
        'minDir() expression'
      end

    end

    class MaxDir < TypeBoundFunc

      def evaluate(context=Gobstones::Runner::NullExecutionContext.new)
        Oeste.new
      end

      def to_s
        'maxDir() expression'
      end

    end
  end
end
