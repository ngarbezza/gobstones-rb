module Gobstones

  module Lang

    class RepeatWithCmd

      attr_reader :var_name, :range_min, :range_max, :cmd_block

      def initialize(var_name, range_min, range_max, cmd_block)
        @var_name = var_name
        @range_min = range_min
        @range_max = range_max
        @cmd_block = cmd_block
      end

      def ==(other)
        self.class == other.class &&
        self.var_name == other.var_name &&
        self.range_min == other.range_min &&
        self.range_max == other.range_max &&
        self.cmd_block == other.cmd_block
      end

    end

  end

end
