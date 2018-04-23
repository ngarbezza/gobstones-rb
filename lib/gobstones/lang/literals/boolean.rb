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
        subclass_responsibility
      end

      def if_true(_block, _context)
        subclass_responsibility
      end

      def if_false(_block, _context)
        subclass_responsibility
      end

      def true?
        subclass_responsibility
      end
    end

    class True < Boolean
      def <(_other)
        false
      end

      def and(other)
        other
      end

      def or(_other)
        self
      end

      def not
        False.new
      end

      def if_true(block, context)
        block.evaluate context
        self
      end

      def if_false(_block, _context)
        # nothing to do, I'm true :)
        self
      end

      def true?
        true
      end

      def to_s
        'True'
      end
    end

    class False < Boolean
      def <(other)
        self != other
      end

      def and(_other)
        self
      end

      def or(other)
        other
      end

      def not
        True.new
      end

      def if_true(_block, _context)
        # nothing to do, I'm false :)
        self
      end

      def if_false(block, context)
        block.evaluate context
        self
      end

      def true?
        false
      end

      def to_s
        'False'
      end
    end
  end
end
