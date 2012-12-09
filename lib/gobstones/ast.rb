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

  ast_node(:IntegerLiteral) { text_value.to_i }

  ast_node(:BooleanLiteral) { eval text_value.downcase }

  ast_node(:ColorLiteral) { Colors::const_get(text_value).new }

  ast_node(:DirectionLiteral) { Directions::const_get(text_value).new }

  ast_node(:MinBoolFuncNode) { false }

  ast_node(:MaxBoolFuncNode) { true }

  ast_node(:MinColorFuncNode) { Colors::Azul.new }

  ast_node(:MaxColorFuncNode) { Colors::Verde.new }

  ast_node(:MinDirFuncNode) { Directions::Norte.new }

  ast_node(:MaxDirFuncNode) { Directions::Oeste.new }

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

end
