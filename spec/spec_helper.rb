require 'simplecov'

require 'matchers/parse_matcher'
require 'gobstones/extensions/fixnum'
require 'gobstones/extensions/boolean'

require 'gobstones/lang/all'

require 'gobstones/runner/cell'
require 'gobstones/runner/board'
require 'gobstones/runner/head'
require 'gobstones/runner/execution_context'
require 'gobstones/runner/gbs_runtime_error'
require 'gobstones/runner/boom_error'

require 'gobstones/parser/treetop_parser'

include Gobstones::Lang
include Gobstones::Runner
include Gobstones::Parser
