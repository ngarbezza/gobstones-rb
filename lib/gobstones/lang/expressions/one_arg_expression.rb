module Gobstones

  module Lang

    class OneArgExpression

      attr_reader :arg

      def initialize(arg)
        @arg = arg
      end

      def ==(other)
        self.class == other.class && arg == other.arg
      end

    end

  end

end
