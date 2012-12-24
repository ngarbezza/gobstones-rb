module Gobstones

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

  ast_node(:IntegerLiteral) { Lang::Number.new text_value.to_i }

  ast_node(:BooleanLiteral) { Lang::const_get(text_value).new }

  ast_node(:ColorLiteral) { Lang::const_get(text_value).new }

  ast_node(:DirectionLiteral) { Lang::const_get(text_value).new }

  ast_node(:MinBoolFuncNode) { Lang::False.new }

  ast_node(:MaxBoolFuncNode) { Lang::True.new }

  ast_node(:MinColorFuncNode) { Lang::Azul.new }

  ast_node(:MaxColorFuncNode) { Lang::Verde.new }

  ast_node(:MinDirFuncNode) { Lang::Norte.new }

  ast_node(:MaxDirFuncNode) { Lang::Oeste.new }

  ast_node(:VarNameNode) { Expressions::VarName.new text_value }

  ast_node(:NroBolitasFuncNode) { Functions::NroBolitas.new arg.value }

  ast_node(:HayBolitasFuncNode) { Functions::HayBolitas.new arg.value }

  ast_node(:PuedeMoverFuncNode) { Functions::PuedeMover.new arg.value }

  ast_node(:SiguienteFuncNode) { Functions::Siguiente.new arg.value }

  ast_node(:PrevioFuncNode) { Functions::Previo.new arg.value }

  ast_node(:OpuestoFuncNode) { Functions::Opuesto.new arg.value }

  ast_node :NopExprNode do
    if sub_exps.empty?
      left.value
    else
      # it is a nested exp
      sub_exps.elements.inject(left.value) do |memo, node|
        case node.op.text_value
        when '+'
          memo = Expressions::Add.new memo, node.right.value
        when '-'
          memo = Expressions::Sub.new memo, node.right.value
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
        memo = Expressions::Mul.new memo, node.right.value
      end
    end
  end

  ast_node :DivModExprNode do
    if sub_exps.empty?
      left.value
    else
      # it is a nested exp
      sub_exps.elements.inject(left.value) do |memo, node|
        case node.op.text_value
        when 'div'
          memo = Expressions::Div.new memo, node.right.value
        when 'mod'
          memo = Expressions::Mod.new memo, node.right.value
        end
      end
    end

  end

end
