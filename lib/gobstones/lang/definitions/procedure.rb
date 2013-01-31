module Gobstones

  module Lang

    class Procedure

      attr_reader :name, :args, :body

      def initialize(name, args, body)
        @name, @args, @body = name, args, body
      end

      def ==(other)
        self.class == other.class &&
        self.name == other.name &&
        self.args == other.args &&
        self.body == other.body
      end

    end

  end

end
