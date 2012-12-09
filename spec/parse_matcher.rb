require 'gobstones/parser'

RSpec::Matchers.define :parse_and_eval_to do |expected|

  def parse(code)
    @parser = Gobstones::Parser.new
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
    "expected #{actual} to parse and eval to #{expected}, but got #{@node.value}"
  end

  failure_message_for_should_not do |actual|
    "expected #{actual} not to parse and eval to #{expected}, got #{@node.value}"
  end

end
