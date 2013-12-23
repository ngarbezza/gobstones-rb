require 'gobstones/modules/equal_by_class'
require 'gobstones/runner/errors/definition_not_found_error'

module Gobstones

  module Lang

    module DefinitionCall

      include Gobstones::EqualByClass

      attr_reader :name, :args

      def initialize(name, args=[])
        @name = name
        @args = args
      end

      def ==(other)
        super(other) && self.name == other.name && self.args == other.args
      end

      def evaluate(context)
        evaluated_args = args.map { |arg| arg.evaluate context }
        context.program_context.definition_named(name, ->(definition) {
          definition.evaluate context, evaluated_args
        }, -> { raise Gobstones::Runner::DefinitionNotFound.new name } )
      end

    end

  end

end
