require 'gobstones/parser/treetop_parser'
require 'gobstones/cli/printer'

include Gobstones::Parser

module Gobstones

  module CLI

    class Runner

      def self.run(file_name)
        new(File.read(file_name)).run
      end

      def initialize(code)
        @code = code
      end

      def run
        print_program_result parse_program.evaluate
      rescue Exception => e
        puts e.backtrace
      end

      private

      def print_program_result(context)
        Printer.new(context).print
      end

      def parse_program
        create_parser.parse(@code).value
      end

      def create_parser
        Gobstones::Parser::TreetopParser.new
      end

    end

  end

end