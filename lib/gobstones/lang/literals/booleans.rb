require 'gobstones/lang/literals/literal'

module Gobstones

  module Lang

    class Boolean < Literal

      def return_type
        :Boolean
      end

    end

    class True < Boolean

      def <(other)
        false
      end

      def and(other)
        other
      end

      def or(other)
        self
      end

      def not
        False.new
      end

    end

    class False < Boolean

      def <(other)
        self != other
      end

      def and(other)
        self
      end

      def or(other)
        other
      end

      def not
        True.new
      end

    end

  end

end
