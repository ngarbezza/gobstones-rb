require 'gobstones/lang/definitions/definition'
require 'gobstones/lang/definitions/no_return'

module Gobstones

  module Lang

    class Procedure < Definition

      def initialize(name, args, body)
        super(name, args, body, NoReturn.new)
      end

      def evaluate(context)
        body.evaluate context
      end

    end

  end

end
