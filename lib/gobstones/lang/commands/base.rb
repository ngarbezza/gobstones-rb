module Gobstones

  module Lang

    module Base

      def ==(other)
        self.class == other.class
      end

    end

  end

end
