# frozen_string_literal: true

require 'simplecov'
require 'test_prof'
require 'test_prof/recipes/rspec/let_it_be'

require 'matchers/parse_matcher'

require 'gobstones/extensions/all'
require 'gobstones/lang/all'
require 'gobstones/runner/all'
require 'gobstones/parser/treetop_parser'

include Gobstones::Lang
include Gobstones::Lang::Commands
include Gobstones::Runner
include Gobstones::Parser

require 'support/gobstones_lang_test_objects'
include GobstonesLangTestObjects
require 'support/board_assertions'
include BoardAssertions

RSpec.configure(&:disable_monkey_patching!)

NullAdapter = Struct.new(:begin_transaction, :rollback_transaction)
TestProf::BeforeAll.adapter = NullAdapter.new(nil, nil)
