require 'coveralls'
Coveralls.wear!

require 'simplecov'

require 'matchers/parse_matcher'

require 'gobstones/extensions/all'
require 'gobstones/lang/all'
require 'gobstones/runner/all'
require 'gobstones/parser/treetop_parser'

include Gobstones::Lang
include Gobstones::Runner
include Gobstones::Parser
