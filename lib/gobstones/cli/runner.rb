# frozen_string_literal: true

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
      rescue Gobstones::Parser::ParseError => e
        handle_parse_error e
      rescue Gobstones::Runner::GobstonesTypeError => e
        handle_type_error e
      rescue Gobstones::Runner::BoomError => e
        handle_boom_error e
      rescue Gobstones::Runner::UndefinedVariableError => e
        handle_undefined_variable_error e
      rescue Gobstones::Runner::EmptyCellError => e
        handle_empty_cell_error e
      rescue Gobstones::Runner::OutOfBoardError => e
        handle_out_of_board_error e
      rescue Gobstones::Runner::DefinitionNotFound => e
        handle_definition_not_found_error e
      rescue Gobstones::Runner::WrongArgumentsError => e
        handle_wrong_arguments_error e
      rescue Gobstones::Runner::GobstonesRuntimeError => e
        handle_runtime_error e
      end

      private

      def print_program_result(result)
        Printer.new(result).print
      end

      def parse_program
        @parser.parse @code
      end

      def handle_parse_error(parse_error)
        parse_error.parser.failure_reason =~ /^(Expected .+) after/m
        puts "#{Regexp.last_match(1).gsub("\n", '$NEWLINE')}:"
        puts parse_error.code.lines.to_a[parse_error.parser.failure_line - 1]
        puts "#{'~' * (parse_error.parser.failure_column - 1)}^"
      end

      def handle_type_error(type_error)
        puts "Type Error: #{type_error.message}"
      end

      def handle_boom_error(boom_error)
        puts "BOOM!! #{boom_error.message}"
      end

      def handle_undefined_variable_error(undefined_variable_error)
        puts undefined_variable_error.message
      end

      def handle_empty_cell_error(_empty_cell_error)
        puts 'There are no balls to take out!'
      end

      def handle_out_of_board_error(_out_of_board_error)
        puts 'You fell from the board!'
      end

      def handle_definition_not_found_error(definition_not_found_error)
        puts definition_not_found_error.message
      end

      def handle_wrong_arguments_error(wrong_arguments_error)
        puts wrong_arguments_error.message
      end

      def handle_runtime_error(runtime_error)
        puts runtime_error.message
      end
    end
  end
end
