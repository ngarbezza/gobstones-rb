module Gobstones

  module Expressions

    class VarName

      attr_reader :name

      def initialize(name)
        @name = name
      end

      def ==(var)
        self.class == var.class && self.name == var.name
      end

    end

  end

end
