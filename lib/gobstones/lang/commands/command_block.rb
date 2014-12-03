require 'gobstones/modules/equal_by_class'

module Gobstones

  module Lang

    class CommandBlock

      include Gobstones::EqualByClass

      attr_reader :commands

      def self.empty
        self.new []
      end

      def initialize(commands)
        @commands = commands
      end

      def ==(other)
        super(other) && self.commands == other.commands
      end

      def empty?
        commands.empty?
      end

      def evaluate(context)
        commands.each { |command| command.evaluate context }
      end

    end

  end

end
