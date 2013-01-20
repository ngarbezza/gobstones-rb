module Gobstones

  module Lang

    RESERVED_IDS = %w(
      if else not True False case of while Skip repeatWith in procedure function
      return Mover Sacar Poner BOOM IrAlOrigen VaciarTablero div mod hayBolitas
      nroBolitas puedeMover Norte Sur Este Oeste minBool maxBool minDir maxDir
      minColor maxColor siguiente previo opuesto Verde Rojo Azul Negro
    )

    def self.ast_node(name, &value_block)
      mod = Module.new do
        define_method :value do
          instance_eval(&value_block)
        end
      end
      const_set name, mod
    end

    ast_node(:IntegerLiteral) { Number.new text_value.to_i }
    ast_node(:BooleanLiteral) { Kernel.const_get(text_value).new }
    ast_node(:ColorLiteral) { Kernel.const_get(text_value).new }
    ast_node(:DirectionLiteral) { Kernel.const_get(text_value).new }

    ast_node(:MinBoolFuncNode) { MinBool.new }
    ast_node(:MaxBoolFuncNode) { MaxBool.new }
    ast_node(:MinColorFuncNode) { MinColor.new }
    ast_node(:MaxColorFuncNode) { MaxColor.new }
    ast_node(:MinDirFuncNode) { MinDir.new }
    ast_node(:MaxDirFuncNode) { MaxDir.new }

    ast_node(:VarNameNode) { VarName.new text_value }

    ast_node(:NroBolitasFuncNode) { NroBolitas.new gexp.value }
    ast_node(:HayBolitasFuncNode) { HayBolitas.new gexp.value }
    ast_node(:PuedeMoverFuncNode) { PuedeMover.new gexp.value }
    ast_node(:SiguienteFuncNode) { Siguiente.new gexp.value }
    ast_node(:PrevioFuncNode) { Previo.new gexp.value }
    ast_node(:OpuestoFuncNode) { Opuesto.new gexp.value }

    ast_node :NopExprNode do
      if sub_exps.empty?
        left.value
      else
        # it is a nested exp
        sub_exps.elements.inject(left.value) do |memo, node|
          case node.op.text_value
          when '+'
            memo = Add.new memo, node.right.value
          when '-'
            memo = Sub.new memo, node.right.value
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
          memo = Mul.new memo, node.right.value
        end
      end
    end

    ast_node :DivModExprNode do
      case op.text_value
      when 'div'
        Div.new left.value, right.value
      when 'mod'
        Mod.new left.value, right.value
      end
    end

    ast_node :PowExprNode do
      if sub_exps.empty?
        left.value
      else
        # it is a nested exp
        sub_exps.elements.inject(left.value) do |memo, node|
          memo = Pow.new memo, node.right.value
        end
      end
    end

    ast_node :RopExprNode do
      classes = {
        '==' => Equal,     '/=' => NotEqual,
        '<'  => LessThan,  '>'  => GreaterThan,
        '<=' => LessEqual, '>=' => GreaterEqual
      }
      classes[rop.text_value].new left.value, right.value
    end

    ast_node(:NotExprNode) { Not.new exp.value }
    ast_node(:AndExprNode) { And.new left.value, right.value }
    ast_node(:OrExprNode) { Or.new left.value, right.value }

    ast_node(:ParenthesesExprNode) { ParenthesesExpr.new gexp.value }
    ast_node(:FuncCallNode) { FuncCall.new lower_id.text_value, gexp_tuple.value }
    ast_node(:TupleExprNode) { exps.text_value.blank? ? [] : exps.value }

    ast_node :GexpsNode do
      if elements.length == 2
        [elements[0].value]
      else
        [exp.value] + exps.value
      end
    end

    ast_node(:SkipCmdNode) { Skip.new }
    ast_node(:BoomCmdNode) { Boom.new string.text_value[1..-2] }

    ast_node(:PonerCmdNode) { Poner.new gexp.value }
    ast_node(:SacarCmdNode) { Sacar.new gexp.value }
    ast_node(:MoverCmdNode) { Mover.new gexp.value }

    ast_node(:IrAlOrigenCmdNode) { IrAlOrigen.new }
    ast_node(:VaciarTableroCmdNode) { VaciarTablero.new }

    ast_node(:ProcCallNode) { ProcCall.new upper_id.text_value, gexp_tuple.value }

  end

end
