require 'gobstones/modules/equality_definition'

module Gobstones
  module Lang
    class NoReturnStatement
      include EqualityDefinition

      def evaluate(context)
        # nothing to do
      end
    end
  end
end
