require 'gobstones/modules/equal_by_class'

module Gobstones
  module Lang
    module Commands
      class MultipleAssignment
        include Gobstones::EqualByClass

        attr_reader :var_tuple, :expression

        def initialize(var_tuple, expression)
          @var_tuple = var_tuple
          @expression = expression
        end

        def ==(other)
          super(other) && var_tuple == other.var_tuple && expression == other.expression
        end

        def evaluate(context)
          # TODO implement as many simple assignments?
          validate_expression_is_function_call
          function_call_result = expression.evaluate(context)
          check_number_of_arguments function_call_result
          function_call_result.length.times do |index|
            context.set var_tuple.variable_at(index), function_call_result[index]
          end
        end

        private

        def validate_expression_is_function_call
          raise Gobstones::Runner::GobstonesTypeError, 'expected a function call in multiple assignment' unless
              expression.is_function_call?
        end

        def check_number_of_arguments(calling_arguments)
          raise Gobstones::Runner::WrongArgumentsError, wrong_number_of_arguments_message(calling_arguments) if
              var_tuple.length != calling_arguments.length
        end

        def wrong_number_of_arguments_message(calling_arguments)
          "Wrong number of arguments in multiple assignment: expected #{var_tuple.length}, got #{calling_arguments.length}"
        end
      end
    end
  end
end
