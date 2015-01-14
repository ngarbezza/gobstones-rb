require 'gobstones/modules/equal_by_class'

module Gobstones

  module Lang

    class Expression

      include Gobstones::EqualByClass

      def evaluate(context)
        raise 'subclass responsibility'
      end

      def is_function_call?
        false
      end

    end

  end

end
