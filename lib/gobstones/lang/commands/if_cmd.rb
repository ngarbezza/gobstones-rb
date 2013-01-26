require 'gobstones/lang/commands/conditional_cmd'

module Gobstones

  module Lang

    class IfCmd < ConditionalCmd

    end

    class IfElseCmd < IfCmd

      attr_reader :else_block

      def initialize(condition, then_block, else_block)
        super(condition, then_block)
        @else_block = else_block
      end

      def ==(other)
        super(other) && self.else_block == other.else_block
      end

    end

  end

end
