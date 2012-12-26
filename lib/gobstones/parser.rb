require 'treetop'
require 'gobstones/lang/ast'

module Gobstones

  class Parser

    def initialize
      base_path = File.expand_path(File.dirname(__FILE__))
      Treetop.load(File.join(base_path, 'gobstones'))
      @parser = GobstonesParser.new
    end

    def parse(code)
      @parser.parse(code)
    end

  end

end
