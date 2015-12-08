require 'gobstones/lang/all'

module Gobstones
  module Parser # TODO divide into smaller modules

    include Gobstones::Lang
    include Gobstones::Lang::Commands

    RESERVED_IDS = %w(
      if else not True False case of while Skip repeatWith in procedure function
      return Mover Sacar Poner BOOM IrAlOrigen VaciarTablero div mod hayBolitas
      nroBolitas puedeMover Norte Sur Este Oeste minBool maxBool minDir maxDir
      minColor maxColor siguiente previo opuesto Verde Rojo Azul Negro Main
    )

    def self.ast_node(name, &value_block)
      # TODO check if it is better to have classes
      ast_module = Module.new do
        define_method(:value) do
          instance_eval(&value_block)
        end
      end
      const_set name, ast_module
    end

    ast_node(:IntegerLiteral) { Number.new(text_value.to_i) }
    ast_node(:BooleanLiteral) { Kernel.const_get(text_value).new }
    ast_node(:ColorLiteral) { Kernel.const_get(text_value).new }
    ast_node(:DirectionLiteral) { Kernel.const_get(text_value).new }

    ast_node(:MinBoolFuncNode) { MinBool.new }
    ast_node(:MaxBoolFuncNode) { MaxBool.new }
    ast_node(:MinColorFuncNode) { MinColor.new }
    ast_node(:MaxColorFuncNode) { MaxColor.new }
    ast_node(:MinDirFuncNode) { MinDir.new }
    ast_node(:MaxDirFuncNode) { MaxDir.new }

    ast_node(:VarNameNode) { VarName.new(text_value) }

    ast_node(:NroBolitasFuncNode) { NroBolitas.new(gexp.value) }
    ast_node(:HayBolitasFuncNode) { HayBolitas.new(gexp.value) }
    ast_node(:PuedeMoverFuncNode) { PuedeMover.new(gexp.value) }
    ast_node(:SiguienteFuncNode) { Siguiente.new(gexp.value) }
    ast_node(:PrevioFuncNode) { Previo.new(gexp.value) }
    ast_node(:OpuestoFuncNode) { Opuesto.new(gexp.value) }

    ast_node :NopExprNode do
      if sub_exps.empty?
        left.value
      else
        # it is a nested exp
        sub_exps.elements.inject(left.value) do |memo, node|
          case node.op.text_value
          when '+'
            Add.new(memo, node.right.value)
          when '-'
            Sub.new(memo, node.right.value)
          end
        end
      end
    end

    ast_node :MulExprNode do
      if sub_exps.empty?
        left.value
      else
        # it is a nested exp
        sub_exps.elements.inject(left.value) do |memo, node|
          Mul.new(memo, node.right.value)
        end
      end
    end

    ast_node :DivModExprNode do
      case op.text_value
      when 'div'
        Div.new(left.value, right.value)
      when 'mod'
        Mod.new(left.value, right.value)
      end
    end

    ast_node :PowExprNode do
      if sub_exps.empty?
        left.value
      else
        # it is a nested exp
        sub_exps.elements.inject(left.value) do |memo, node|
          Pow.new(memo, node.right.value)
        end
      end
    end

    ast_node :RopExprNode do
      classes = {
        '==' => Equal,     '/=' => NotEqual,
        '<'  => LessThan,  '>'  => GreaterThan,
        '<=' => LessEqual, '>=' => GreaterEqual
      }
      classes[rop.text_value].new(left.value, right.value)
    end

    ast_node(:NotExprNode) { Not.new(exp.value) }
    ast_node(:AndExprNode) { And.new(left.value, right.value) }
    ast_node(:OrExprNode) { Or.new(left.value, right.value) }

    ast_node(:ParenthesesExprNode) { EnclosedByParensExpression.new(gexp.value) }
    ast_node(:FuncCallNode) { FunctionCall.new(func_name.text_value, gexp_tuple.value) }
    ast_node(:TupleExprNode) { exps.empty? ? [] : exps.value }

    ast_node :GexpsNode do
      if elements.length == 2
        [elements[0].value]
      else
        [exp.value] + exps.value
      end
    end

    ast_node(:SkipCmdNode) { Skip.new }
    ast_node(:BoomCmdNode) { Boom.new(string.text_value[1..-2]) }

    ast_node(:PonerCmdNode) { Poner.new(gexp.value) }
    ast_node(:SacarCmdNode) { Sacar.new(gexp.value) }
    ast_node(:MoverCmdNode) { Mover.new(gexp.value) }

    ast_node(:IrAlOrigenCmdNode) { IrAlOrigen.new }
    ast_node(:VaciarTableroCmdNode) { VaciarTablero.new }

    ast_node(:ProcCallNode) { ProcedureCall.new(proc_name.text_value, gexp_tuple.value) }

    ast_node(:SingleAssignmentNode) { SingleAssignment.new(var_name.value, gexp.value) }
    ast_node(:MultipleAssignmentNode) { MultipleAssignment.new(var_tuple.value, gexp.value) }

    ast_node(:CmdBlockNode) { CommandBlock.new(create_commands(commands)) }

    ast_node :IfCmdNode do
      if else_clause.empty?
        If.new(gexp.value, then_block.value)
      else
        IfElse.new(gexp.value, then_block.value, else_clause.else_block.value)
      end
    end

    ast_node(:WhileCmdNode) { While.new(gexp.value, cmd_block.value) }

    ast_node :RepeatWithCmdNode do
      RepeatWith.new(var_name.value, range_min.value, range_max.value, cmd_block.value)
    end

    # TODO abstract duplication, very similar to GexpsNode
    ast_node(:VarNamesNode) do
      if elements.length == 2
        # TODO check why it is needed to create a VarName
        # instead of having already a VarName in elements[0]
        [VarName.new(elements[0].text_value)]
      else
        [vn.value] + vns.value
      end
    end

    ast_node(:VarTupleNode) do
      variables = vns.empty? ? [] : vns.value
      VarTuple.new(variables)
    end

    ast_node(:ProcedureNode) do
      Procedure.new(proc_name.text_value, var_tuple.value, cmd_block.value)
    end

    ast_node(:FunctionNode) do
      cmd_block = CommandBlock.new(create_commands(commands))
      Function.new(func_name.text_value, var_tuple.value, cmd_block, func_return.value)
    end

    ast_node(:FuncReturnNode) { ReturnFromFunction.new(gexp_tuple_1.value) }
    ast_node(:MainReturnNode) { ReturnFromMain.new(var_tuple.value) }

    ast_node(:MainDefNode) do
      command_block = CommandBlock.new(create_commands(commands))
      return_statement = ret.empty? ? NoReturnStatement.new : ret.value
      Main.new(command_block, return_statement)
    end

    ast_node(:ProgramNode) do
      defs = definitions.elements.map { |node| node.definition.value }
      Program.new(defs, main_def.value)
    end

    def create_commands(commands)
      commands.elements.map { |node| node.command.value }
    end

  end
end
