require 'gobstones/parser/treetop_parser'
require 'gobstones/lang/program'

PARSER = Gobstones::Parser::TreetopParser.new

module ParserMatchersHelper

  def parse(code)
    @node = PARSER.parse code
  end

end

RSpec::Matchers.define :be_parsed_to do |expected|

  puts '!!!!!!! DEPRECATED !!!!!!!
  use be_parsed_as(elem).(and_fail | and_return(expected))'

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

  puts '!!!!!!! DEPRECATED !!!!!!!
  use be_parsed_as(elem).(and_fail | and_return(expected))'

  include ParserMatchersHelper

  match_for_should do |actual|
    parse actual
    fail('the parser gave no results') if @node.nil?
    expected_program = Gobstones::Lang::Program.new [], expected
    @node.value == expected_program
  end

end

RSpec::Matchers.define :fail_to_parse do

  puts '!!!!!!! DEPRECATED !!!!!!!
  use be_parsed_as(elem).(and_fail | and_return(expected))'

  include ParserMatchersHelper

  match do |actual|
    parse actual
    @node.nil?
  end

end

RSpec::Matchers.define :be_parsed_as do |grammar_elem|

  @valid_nodes = [:program, :definition, :main, :expression, :command ]

  chain :and_fail do
    @expect_parser_results = false
  end

  chain :and_return do |expected|
    @expect_parser_results = true
    @expected = expected
  end

  match do |actual|
    fail 'wrong expectation' if @expect_parser_results.nil?
    fail 'grammar elem not supported' if !@valid_nodes.include?(grammar_elem)

    parse send("#{grammar_elem}_code_to_program", actual)

    if @expect_parser_results
      @node.value == send("#{grammar_elem}_node_to_program", @expected)
    else
      @node.nil?
    end
  end

  def program_code_to_program(code)
    code
  end

  def program_node_to_program(node)
    node
  end

  def definition_code_to_program(code)
    "#{code}
    procedure Main() {}"
  end

  def definition_node_to_program(node)
    Program.new [node], Main.new(CmdBlock.new([]), NoReturn.new)
  end

  def main_code_to_program(code)
    code
  end

  def main_node_to_program(node)
    Program.new [], node
  end

  def parse(code)
    @node = PARSER.parse code
  end

end
