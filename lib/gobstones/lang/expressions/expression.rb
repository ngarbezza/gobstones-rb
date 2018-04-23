require 'gobstones/modules/equality_definition'
require 'error_handling_protocol'

module Gobstones
  module Lang
    class Expression
      include EqualityDefinition

      def evaluate(_context)
        subclass_responsibility
      end

      def is_function_call?
        false
      end
    end
  end
end
