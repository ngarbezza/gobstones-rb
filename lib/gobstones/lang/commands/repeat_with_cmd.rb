require 'gobstones/lang/commands/single_assignment'
require 'gobstones/lang/commands/command_block'
require 'gobstones/lang/commands/while_cmd'
require 'gobstones/lang/expressions/comparison_expressions'
require 'gobstones/lang/expressions/primitive_functions'
require 'gobstones/runner/errors/gobstones_runtime_error'
require 'gobstones/runner/errors/gobstones_type_error'
require 'gobstones/modules/equal_by_class'

module Gobstones
  module Lang
    class RepeatWithCmd

      include Gobstones::EqualByClass

      attr_reader :var_name, :range_min, :range_max, :cmd_block

      def initialize(var_name, range_min, range_max, cmd_block)
        @var_name = var_name
        @range_min = range_min
        @range_max = range_max
        @cmd_block = cmd_block
      end

      def ==(other)
        super(other) &&
        self.var_name == other.var_name &&
        self.range_min == other.range_min &&
        self.range_max == other.range_max &&
        self.cmd_block == other.cmd_block
      end

      def evaluate(context)
        validate_range_values context
        validate_index_variable_not_defined context
        while_based_equivalent_cmd.evaluate context
        clear_index_variable_from context
      end

      private

      def clear_index_variable_from(context)
        context.clear var_name
      end

      def validate_range_values(context)
        raise Gobstones::Runner::GobstonesTypeError, "types don't match in range values" \
          unless range_min.evaluate(context).same_type_as(range_max.evaluate(context))
      end

      def validate_index_variable_not_defined(context)
        raise Gobstones::Runner::GobstonesRuntimeError, "index variable can't be used because it's already defined" \
          if context.has_variable_named?(var_name.name)
      end

      def while_based_equivalent_cmd
        #
        # repeatWith var in min..max block
        #        is equivalent to
        # if (min <= max) { var := min; while (var < max) { block; var := siguiente(var) }; block }
        #
        assign_cmd = SingleAssignment.new(var_name, range_min)
        while_cond = LessThan.new(var_name, range_max)
        increment = SingleAssignment.new(var_name, Siguiente.new(var_name))
        while_block = CommandBlock.new([cmd_block, increment])
        while_cmd = WhileCmd.new(while_cond, while_block)
        if_cond = LessEqual.new(range_min, range_max)
        IfCmd.new(if_cond, CommandBlock.new([assign_cmd, while_cmd, cmd_block]))
      end

    end
  end
end
