require 'gobstones/modules/equal_by_class'

module Gobstones

  module Lang

    class Definition

      include Gobstones::EqualByClass

      attr_reader :name, :args, :body, :return_statement

      def initialize(name, args, body, return_statement)
        @name = name
        @args = args
        @body = body
        @return_statement = return_statement
      end

      def ==(other)
        super(other) &&
        self.name == other.name &&
        self.args == other.args &&
        self.body == other.body &&
        self.return_statement == other.return_statement
      end

      def named?(a_name)
        name == a_name
      end

    end

  end

end
