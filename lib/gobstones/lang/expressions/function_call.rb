module Gobstones

  module Lang

    class FuncCall

      attr_reader :func_name, :args

      def initialize(func_name, args=[])
        @func_name = func_name
        @args = args
      end

      def ==(other)
        self.class == other.class &&
        self.func_name == other.func_name &&
        self.args == other.args
      end

    end

  end

end
