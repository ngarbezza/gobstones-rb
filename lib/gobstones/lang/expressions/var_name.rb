require 'gobstones/lang/expressions/expression'

module Gobstones

  module Lang

    class VarName < Expression

      attr_reader :name

      def initialize(name)
        @name = name
      end

      def ==(var)
        super(var) && self.name == var.name
      end

      def hash
        @name.hash
      end

      def evaluate(context)
        context.get self
      end

      def named?(a_name)
        name == a_name
      end

      def to_s
        "variable named '#{name}'"
      end

    end

  end

end
