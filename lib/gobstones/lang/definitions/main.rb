# frozen_string_literal: true

require 'gobstones/lang/definitions/definition'
require 'gobstones/lang/definitions/var_tuple'
require 'gobstones/lang/definitions/no_return_statement'
require 'gobstones/lang/definitions/return_from_main'

module Gobstones
  module Lang
    class Main < Definition
      def initialize(body, return_statement)
        super('Main', VarTuple.empty, body, return_statement)
      end

      def evaluate(context)
        body.evaluate context
        return_statement.evaluate(context) || []
      end
    end
  end
end
