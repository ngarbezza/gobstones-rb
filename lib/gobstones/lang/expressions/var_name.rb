require 'gobstones/modules/equal_by_class'

module Gobstones

  module Lang

    class VarName

      include Gobstones::EqualByClass

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
        "'#{name}'"
      end

      def is_function_call?
        false
      end

    end

  end

end
