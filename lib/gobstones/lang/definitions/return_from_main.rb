require 'gobstones/modules/equal_by_class'

module Gobstones

  module Lang

    class ReturnFromMain

      include Gobstones::EqualByClass

      attr_reader :var_tuple

      def initialize(var_tuple)
        @var_tuple = var_tuple
      end

      def ==(other)
        super(other) &&
        self.var_tuple == other.var_tuple
      end

    end

  end

end
