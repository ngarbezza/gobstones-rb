require 'treetop'
require 'gobstones/parser/ast/ast'
require 'gobstones/parser/parse_error'

module Gobstones
  module Parser
    class TreetopParser

      def initialize
        Treetop.load grammar_file
        @parser = GobstonesParser.new
      end

      def parse(code)
        code_without_comments = remove_comments_from(code)
        result = @parser.parse(code_without_comments)
        raise ParseError.new(self, code_without_comments) if result.nil?
        result.value
      end

      def failure_reason
        @parser.failure_reason
      end

      def failure_line
        @parser.failure_line
      end

      def failure_column
        @parser.failure_column
      end

      def remove_comments_from(code)
        code
          .gsub(single_line_c_style_comments_regex, '')
          .gsub(single_line_haskell_style_comments_regex, '')
          .gsub(multi_line_c_style_comments_regex, '')
          .gsub(multi_line_haskell_style_comments_regex, '')
      end

      private

      def grammar_file
        File.join(base_path, 'grammar/gobstones')
      end

      def base_path
        File.expand_path(File.dirname(__FILE__))
      end

      def single_line_c_style_comments_regex
        /\/\/.*$/
      end

      def single_line_haskell_style_comments_regex
        /--.*$/
      end

      def multi_line_c_style_comments_regex
        /\/\*.*?\*\//m
      end

      def multi_line_haskell_style_comments_regex
        /{-.*?\-}/m
      end

    end
  end
end
