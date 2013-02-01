require 'simplecov'
SimpleCov.start

require 'parse_matcher'

# TODO find best way to require all those files
require 'gobstones/lang/literals/colors'
require 'gobstones/lang/literals/directions'
require 'gobstones/lang/literals/booleans'
require 'gobstones/lang/literals/number'
require 'gobstones/lang/expressions/arithmetic_expressions'
require 'gobstones/lang/expressions/comparison_expressions'
require 'gobstones/lang/expressions/boolean_expressions'
require 'gobstones/lang/expressions/primitive_functions'
require 'gobstones/lang/expressions/type_bound_functions'
require 'gobstones/lang/expressions/var_name'
require 'gobstones/lang/expressions/parentheses_expression'
require 'gobstones/lang/expressions/function_call'
require 'gobstones/lang/commands/procedure_call'
require 'gobstones/lang/commands/command_block'
require 'gobstones/lang/commands/skip_cmd'
require 'gobstones/lang/commands/boom_cmd'
require 'gobstones/lang/commands/poner_cmd'
require 'gobstones/lang/commands/mover_cmd'
require 'gobstones/lang/commands/sacar_cmd'
require 'gobstones/lang/commands/if_cmd'
require 'gobstones/lang/commands/while_cmd'
require 'gobstones/lang/commands/repeat_with_cmd'
require 'gobstones/lang/definitions/var_tuple'
require 'gobstones/lang/definitions/procedure'

require 'gobstones/runner/cell'
require 'gobstones/runner/board'
require 'gobstones/runner/head'
require 'gobstones/runner/execution_context'

include Gobstones::Lang
include Gobstones::Runner
