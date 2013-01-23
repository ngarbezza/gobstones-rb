require 'gobstones/parser/treetop_parser'

RSpec::Matchers.define :be_parsed_to do |expected|

  def parse(code)
    @parser = Gobstones::Parser::TreetopParser.new
    @node = @parser.parse code
  end

  match_for_should do |actual|
    parse actual
    fail('no results from parsed code') if @node.nil?
    @node.value == expected
  end

  match_for_should_not do |actual|
    parse actual
    if @node
      @node.value != expected
    else
      true
    end
  end

  failure_message_for_should do |actual|
    "expected #{actual} to be parsed to #{expected}, but got #{@node.value}"
  end

  failure_message_for_should_not do |actual|
    "expected #{actual} to not be parsed to #{expected}, got #{@node.value}"
  end

end
