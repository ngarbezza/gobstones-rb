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
        # evaluate body
        body.evaluate context
        # evaluate return
      end

    end

  end

end
