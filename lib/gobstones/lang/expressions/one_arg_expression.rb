module Gobstones

  module Lang

    module OneArgExpression

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
