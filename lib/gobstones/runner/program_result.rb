module Gobstones

  module Runner

    class ProgramResult

      attr_reader :head, :return_values

      def initialize(head, return_values)
        @head = head
        @return_values = return_values
      end

    end

  end

end
