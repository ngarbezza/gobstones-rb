module Gobstones

  module Lang

    class Literal

      include Comparable

      def evaluate(context=nil)
        self
      end

      def <=>(other)
        self == other ? 0 : (self < other ? -1 : 1)
      end

      def ==(other)
        self.class == other.class # default behavior
      end

      def <(other)
        raise 'subclass responsibility'
      end

      def if_true(block, context)
        raise GbsTypeError, "#{self} is not a boolean"
      end

      def if_false(block, context)
        raise GbsTypeError, "#{self} is not a boolean"
      end

      def is_true?
        raise GbsTypeError, "#{self} is not a boolean"
      end

      OPERATORS_MAPPING = { :equal => :==, :not_equal => '!='.to_sym,
        :less_than => :<, :less_equal => :<=,
        :greater_than => :>, :greater_equal => :>= }

      OPERATORS_MAPPING.each do |gbs_op, ruby_op|
        define_method gbs_op do |other|
          self.send(ruby_op, other).to_gbs_bool
        end
      end

    end

  end

end
