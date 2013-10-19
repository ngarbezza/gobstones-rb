require 'gobstones/modules/equal_by_class'

module Gobstones

  module Lang

    class CmdBlock

      include Gobstones::EqualByClass

      attr_reader :cmds

      def self.empty
        self.new []
      end

      def initialize(cmds)
        @cmds = cmds
      end

      def ==(other)
        super(other) && self.cmds == other.cmds
      end

      def empty?
        cmds.empty?
      end

      def evaluate(context)
        cmds.each { |cmd| cmd.evaluate context }
      end

    end

  end

end
