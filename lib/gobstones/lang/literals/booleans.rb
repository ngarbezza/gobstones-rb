require 'gobstones/lang/literals/literal'

module Gobstones

  module Lang

    class Boolean

      include Literal

      def ==(other)
        self.class == other.class
      end

      def return_type
        :Boolean
      end

    end

    class True < Boolean

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
