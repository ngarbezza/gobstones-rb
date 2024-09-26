# frozen_string_literal: true

require 'gobstones/modules/equality_definition'

module Gobstones
  module Lang
    module Commands
      class CommandBlock
        include EqualityDefinition

        attr_reader :commands

        def self.empty
          new([])
        end

        def self.with_just(a_command)
          new([a_command])
        end

        def initialize(commands)
          @commands = commands
        end

        def equality_attributes
          %i[commands]
        end

        def empty?
          commands.empty?
        end

        def evaluate(context)
          commands.each { |command| command.evaluate(context) }
        end
      end
    end
  end
end
