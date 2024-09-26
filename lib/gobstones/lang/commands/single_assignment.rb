# frozen_string_literal: true

require 'gobstones/modules/equality_definition'

module Gobstones
  module Lang
    module Commands
      class SingleAssignment
        include EqualityDefinition

        attr_reader :var_name, :expression

        def initialize(var_name, expression)
          @var_name = var_name
          @expression = expression
        end

        def equality_attributes
          %i[var_name expression]
        end

        def evaluate(context)
          context.set(var_name, expression.evaluate(context))
        end
      end
    end
  end
end
