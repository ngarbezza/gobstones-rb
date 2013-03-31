module Gobstones

  module Lang

    class CmdBlock

      attr_reader :cmds

      def initialize(cmds)
        @cmds = cmds
      end

      def ==(other)
        self.class == other.class &&
        self.cmds == other.cmds
      end

      def evaluate(context)
        cmds.each { |cmd| cmd.evaluate context }
      end

    end

  end

end
