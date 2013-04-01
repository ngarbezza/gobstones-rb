module Gobstones

  module Lang

    class VarName

      attr_reader :name

      def initialize(name)
        @name = name
      end

      def ==(var)
        self.class == var.class && self.name == var.name
      end

      def evaluate(context)
        context.get self
      end

    end

  end

end
