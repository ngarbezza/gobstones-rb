module Gobstones

  module Lang

    class FuncCall

      attr_reader :func_name

      def initialize(func_name)
        @func_name = func_name
      end

      def ==(other)
        self.class == other.class &&
          self.func_name == other.func_name
      end

    end

  end

end
