require 'gobstones/lang/literals/literal'

module Gobstones

  module Lang

    class Boolean < Literal

      def return_type
        :Boolean
      end

      def opposite
        self.not
      end

      def previous
        self.not
      end

      def next
        self.not
      end

      def not
        raise 'subclass responsibility'
      end

      def if_true(block, context)
        raise 'subclass responsibility'
      end

      def if_false(block, context)
        raise 'subclass responsibility'
      end

      def is_true?
        raise 'subclass responsibility'
      end

    end

    class True < Boolean

      def <(other)
        false
      end

      def and(other)
        other
      end

      def or(other)
        self
      end

      def not
        False.new
      end

      def if_true(block, context)
        block.evaluate context
      end

      def if_false(block, context)
        # nothing to do, I'm true :)
      end

      def is_true?
        true
      end

    end

    class False < Boolean

      def <(other)
        self != other
      end

      def and(other)
        self
      end

      def or(other)
        other
      end

      def not
        True.new
      end

      def if_true(block, context)
        # nothing to do, I'm false :)
      end

      def if_false(block, context)
        block.evaluate context
      end

      def is_true?
        false
      end

    end

  end

end
