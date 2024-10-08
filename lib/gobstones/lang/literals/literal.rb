# frozen_string_literal: true

require 'gobstones/lang/expressions/expression'
require 'gobstones/runner/errors/gobstones_type_error'
require 'gobstones/runner/execution_context'
require 'gobstones/extensions/boolean'
require 'error_handling_protocol'

module Gobstones
  module Lang
    class Literal < Expression
      include Comparable

      def evaluate(_context)
        self
      end

      # TODO EqualityDefinition module seems to fail used with Comparable

      def ==(other)
        self.class == other.class
      end

      alias_method :eql?, :==

      def <=>(other)
        return 0 if self == other
        return -1 if self < other

        1
      end

      def <(_other)
        subclass_responsibility
      end

      OPERATORS_MAPPING = {
        equal: :==,
        not_equal: :!=,
        less_than: :<,
        less_equal: :<=,
        greater_than: :>,
        greater_equal: :>=,
      }.freeze

      OPERATORS_MAPPING.each do |gbs_op, ruby_op|
        define_method(gbs_op) do |other|
          send(ruby_op, other).to_gbs_bool
        end
      end

      def same_type_as(other)
        return_type == other.return_type
      end

      def return_type
        subclass_responsibility
      end

      def if_true(_block, _context)
        not_boolean_type_error
      end

      def if_false(_block, _context)
        not_boolean_type_error
      end

      def true?
        not_boolean_type_error
      end

      def not
        not_boolean_type_error
      end

      private

      def not_boolean_type_error
        raise Runner::GobstonesTypeError, "#{self} is not a boolean"
      end
    end
  end
end
