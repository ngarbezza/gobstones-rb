module Gobstones
  module Parser
    class ParseError < StandardError

      attr_reader :parser, :code

      def initialize(parser, code)
        @parser, @code = parser, code
      end

    end
  end
end
