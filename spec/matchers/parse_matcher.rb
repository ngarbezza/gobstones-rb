require 'gobstones/parser/treetop_parser'
require 'gobstones/lang/program'

PARSER = Gobstones::Parser::TreetopParser.new

RSpec::Matchers.define :be_parsed_as do |grammar_elem|

  @valid_nodes = [:program, :definition, :main, :expression, :command, :var_tuple ]

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

    begin
      parse send("#{grammar_elem}_code_to_program", actual)
      @value == send("#{grammar_elem}_node_to_program", @expected)
    rescue Gobstones::Parser::ParseError => e
      !@expect_parser_results
    end
  end

  def program_code_to_program(code)
    code
  end

  def program_node_to_program(node)
    node
  end

  def main_code_to_program(code)
    code
  end

  def main_node_to_program(node)
    Program.new [], node
  end

  def definition_code_to_program(code)
    "#{code}\nprocedure Main() {}"
  end

  def definition_node_to_program(node)
    Program.new [node], Main.new(CmdBlock.new([]), NoReturnStatement.new)
  end

  def expression_code_to_program(code)
    "procedure Main() { x := #{code} }"
  end

  def expression_node_to_program(node)
    assign = SingleAssignment.new VarName.new('x'), node
    main_node_to_program Main.new(CmdBlock.new([assign]), NoReturnStatement.new)
  end

  def command_code_to_program(code)
    "procedure Main() { #{code} }"
  end

  def command_node_to_program(node)
    main_node_to_program Main.new(CmdBlock.new([node]), NoReturnStatement.new)
  end

  def var_tuple_code_to_program(code)
    "procedure Main() { return #{code} }"
  end

  def var_tuple_node_to_program(node)
    Program.new [], Main.new(CmdBlock.new([]), ReturnFromMain.new(node))
  end

  def parse(code)
    @value = PARSER.parse code
  end

end
