require 'gobstones/lang/definitions/definition'
require 'gobstones/lang/definitions/var_tuple'
require 'gobstones/lang/definitions/no_return'
require 'gobstones/lang/definitions/return_from_main'

module Gobstones

  module Lang

    class Main < Definition

      def initialize(body, return_statement)
        super('Main', VarTuple.new([]), body, return_statement)
      end

    end

  end

end