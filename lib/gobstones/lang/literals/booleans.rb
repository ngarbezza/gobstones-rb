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

    end

    class False < Boolean

    end

  end

end
