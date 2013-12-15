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

      alias eql? ==

      def hash
        @name.hash
      end

      def evaluate(context)
        context.get self
      end

      def named?(a_name)
        name == a_name
      end

    end

  end

end
