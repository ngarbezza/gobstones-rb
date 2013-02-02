require 'gobstones/parser/treetop_parser'
require 'gobstones/lang/program'

PARSER = Gobstones::Parser::TreetopParser.new

module ParserMatchersHelper

  def parse(code)
    @node = PARSER.parse code
  end

end

RSpec::Matchers.define :be_parsed_to do |expected|

  include ParserMatchersHelper

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

RSpec::Matchers.define :be_parsed_as_main_def_to do |expected|

  include ParserMatchersHelper

  match_for_should do |actual|
    parse actual
    fail('the parser gave no results') if @node.nil?
    expected_program = Gobstones::Lang::Program.new [], expected
    @node.value == expected_program
  end

end

RSpec::Matchers.define :fail_to_parse do

  include ParserMatchersHelper

  match do |actual|
    parse actual
    @node.nil?
  end

end
