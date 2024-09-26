# frozen_string_literal: true

require 'gobstones/modules/equality_definition'
require 'gobstones/extensions/string'

module Gobstones
  module Lang
    class VarTuple
      include EqualityDefinition

      attr_reader :variables

      def self.empty
        new([])
      end

      def self.with_names(var_names)
        new(var_names.map(&:to_var_name))
      end

      def initialize(variables)
        @variables = variables
      end

      def equality_attributes
        %i[variables]
      end

      def length
        variables.length
      end

      def variable_at(index)
        variables[index]
      end
    end
  end
end
