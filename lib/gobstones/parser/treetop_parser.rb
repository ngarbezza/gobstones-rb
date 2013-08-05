require 'treetop'
require 'gobstones/parser/ast/ast'

module Gobstones

  module Parser

    class TreetopParser

      def initialize
        Treetop.load grammar_file
        @parser = GobstonesParser.new
      end

      def parse(code)
        @parser.parse remove_comments_from(code)
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
        File.join base_path, 'grammar/gobstones'
      end

      def base_path
        File.expand_path File.dirname(__FILE__)
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
