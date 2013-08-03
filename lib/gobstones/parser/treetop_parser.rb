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
        code.gsub(/\/\/(.*)$/, '').gsub(/--(.*)$/, '')
      end

      private

      def grammar_file
        File.join base_path, 'grammar/gobstones'
      end

      def base_path
        File.expand_path File.dirname(__FILE__)
      end

    end

  end

end
