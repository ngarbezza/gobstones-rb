require 'gobstones/modules/equal_by_class'

module Gobstones
  module Lang
    module Commands
      class CommandBlock
        include EqualByClass

        attr_reader :commands

        def self.empty
          new([])
        end

        def initialize(commands)
          @commands = commands
        end

        def ==(other)
          super(other) && commands == other.commands
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
end
