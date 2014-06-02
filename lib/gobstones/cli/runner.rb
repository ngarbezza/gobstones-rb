require 'gobstones/parser/treetop_parser'
require 'gobstones/parser/parse_error'
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
        @parser = Gobstones::Parser::TreetopParser.new
      end

      def run
        print_program_result parse_program.evaluate
      rescue Gobstones::Parser::ParseError => parse_error
        handle_parse_error parse_error
      rescue Exception => e
        # TODO handle more gobstones exceptions
        raise e
      end

      private

      def print_program_result(context)
        Printer.new(context).print
      end

      def parse_program
        @parser.parse(@code)
      end

      def handle_parse_error(parse_error)
        parse_error.parser.failure_reason =~ /^(Expected .+) after/m
        puts "#{$1.gsub("\n", '$NEWLINE')}:"
        puts parse_error.code.lines.to_a[parse_error.parser.failure_line - 1]
        puts "#{'~' * (parse_error.parser.failure_column - 1)}^"
      end

    end

  end

end
