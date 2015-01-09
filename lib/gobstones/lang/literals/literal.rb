require 'gobstones/modules/equal_by_class'
require 'gobstones/runner/errors/gobstones_type_error'

module Gobstones

  module Lang

    class Literal

      include Comparable
      include Gobstones::EqualByClass

      def evaluate(context=nil)
        self
      end

      def <=>(other)
        self == other ? 0 : (self < other ? -1 : 1)
      end

      def <(other)
        raise 'subclass responsibility'
      end

      OPERATORS_MAPPING = {
          :equal => :==,
          :not_equal => '!='.to_sym,
          :less_than => :<,
          :less_equal => :<=,
          :greater_than => :>, :greater_equal => :>=
      }

      OPERATORS_MAPPING.each do |gbs_op, ruby_op|
        define_method gbs_op do |other|
          send(ruby_op, other) ? True.new : False.new
        end
      end

      def same_type_as(other)
        self.return_type == other.return_type
      end

      def return_type
        raise 'subclass responsibility'
      end

      def if_true(block, context)
        not_boolean_type_error
      end

      def if_false(block, context)
        not_boolean_type_error
      end

      def is_true?
        not_boolean_type_error
      end

      def not
        not_boolean_type_error
      end

      private

      def not_boolean_type_error
        raise Gobstones::Runner::GobstonesTypeError, "#{self} is not a boolean"
      end

    end

  end

end
