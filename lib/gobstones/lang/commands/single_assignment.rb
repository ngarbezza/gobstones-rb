require 'gobstones/modules/equal_by_class'

module Gobstones
  module Lang
    module Commands
      class SingleAssignment
        include EqualByClass

        attr_reader :var_name, :expression

        def initialize(var_name, expression)
          @var_name = var_name
          @expression = expression
        end

        def ==(other)
          super(other) && var_name == other.var_name && expression == other.expression
        end

        def evaluate(context)
          context.set var_name, expression.evaluate(context)
        end
      end
    end
  end
end
