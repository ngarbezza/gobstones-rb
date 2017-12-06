require 'gobstones/modules/equal_by_class'
require 'error_handling_protocol'

module Gobstones
  module Lang
    class Expression
      include EqualByClass

      def evaluate(_context)
        subclass_responsibility
      end

      def is_function_call?
        false
      end
    end
  end
end
