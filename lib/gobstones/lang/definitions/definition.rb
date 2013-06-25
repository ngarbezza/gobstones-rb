module Gobstones

  module Lang

    class Definition

      attr_reader :name, :args, :body, :return_statement

      def initialize(name, args, body, return_statement)
        @name = name
        @args = args
        @body = body
        @return_statement = return_statement
      end

      def ==(other)
        self.class == other.class &&
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
