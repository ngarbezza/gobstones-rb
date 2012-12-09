module Gobstones

  RESERVED_IDS = %w(
    if else not True False case of while Skip repeatWith in procedure function
    return Mover Sacar Poner BOOM IrAlOrigen VaciarTablero div mod hayBolitas
    nroBolitas puedeMover Norte Sur Este Oeste minBool maxBool minDir maxDir
    minColor maxColor siguiente previo opuesto Verde Rojo Azul Negro
  )

  def self.ast_node(name, value_block)
    mod = Module.new do
      define_method :value do
        case value_block.arity
        when 0
          value_block.call
        when 1
          value_block.call text_value
        when 2
          value_block.call text_value, elements
        end
      end
    end
    const_set name, mod
  end

  ast_node :IntegerLiteral, ->(text) { text.to_i }
  ast_node :BooleanLiteral, ->(text) { eval text.downcase }
  ast_node :ColorLiteral, ->(text) { Colors::const_get(text).new }
  ast_node :DirectionLiteral, ->(text) { Directions::const_get(text).new }
  ast_node :MinBoolFuncNode, -> { false }
  ast_node :MaxBoolFuncNode, -> { true }
  ast_node :MinColorFuncNode, -> { Colors::Azul.new }
  ast_node :MaxColorFuncNode, -> { Colors::Verde.new }
  ast_node :MinDirFuncNode, -> { Directions::Norte.new }
  ast_node :MaxDirFuncNode, -> { Directions::Oeste.new }
  ast_node :VarNameNode, ->(text) { Expressions::VarName.new text }
  ast_node :NroBolitasFuncNode, ->(text, tokens) {
    Functions::NroBolitas.new tokens[1].value
  }
end
