# frozen_string_literal: true

require 'gobstones/lang/expressions/expression'
require 'gobstones/lang/literals/boolean'
require 'gobstones/lang/literals/color'
require 'gobstones/lang/literals/direction'
require 'gobstones/runner/execution_context'

module Gobstones
  module Lang
    TypeBoundFunc = Class.new(Expression)

    class MinBool < TypeBoundFunc
      def evaluate(_context)
        False.new
      end

      def to_s
        'minBool() expression'
      end
    end

    class MaxBool < TypeBoundFunc
      def evaluate(_context)
        True.new
      end

      def to_s
        'maxBool() expression'
      end
    end

    class MinColor < TypeBoundFunc
      def evaluate(_context)
        Azul.new
      end

      def to_s
        'minColor() expression'
      end
    end

    class MaxColor < TypeBoundFunc
      def evaluate(_context)
        Verde.new
      end

      def to_s
        'maxColor() expression'
      end
    end

    class MinDir < TypeBoundFunc
      def evaluate(_context)
        Norte.new
      end

      def to_s
        'minDir() expression'
      end
    end

    class MaxDir < TypeBoundFunc
      def evaluate(_context)
        Oeste.new
      end

      def to_s
        'maxDir() expression'
      end
    end
  end
end
