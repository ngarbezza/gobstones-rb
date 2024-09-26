# frozen_string_literal: true

require 'gobstones/modules/equality_definition'

module Gobstones
  module Lang
    class ReturnFromMain
      include EqualityDefinition

      attr_reader :var_tuple

      def initialize(var_tuple)
        @var_tuple = var_tuple
      end

      def equality_attributes
        %i[var_tuple]
      end

      def evaluate(context)
        evaluated_variables(context).to_h
      end

      private

      def evaluated_variables(context)
        var_tuple.variables.map do |variable|
          [variable, context.get(variable)]
        end
      end
    end
  end
end
