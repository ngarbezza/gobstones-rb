module Gobstones

  RESERVED_IDS = %w(
    if else not True False case of while Skip repeatWith in procedure function
    return Mover Sacar Poner BOOM IrAlOrigen VaciarTablero div mod hayBolitas
    nroBolitas puedeMover Norte Sur Este Oeste minBool maxBool minDir maxDir
    minColor maxColor siguiente previo opuesto Verde Rojo Azul Negro
  )

  module IntegerLiteral
    def value
      text_value.to_i
    end
  end

  module BooleanLiteral
    def value
      eval text_value.downcase
    end
  end

  module ColorLiteral
    def value
      case text_value
      when 'Azul'
        Colors::Azul.new
      when 'Negro'
        Colors::Negro.new
      when 'Rojo'
        Colors::Rojo.new
      when 'Verde'
        Colors::Verde.new
      end
    end
  end

  module DirectionLiteral
    def value
      case text_value
      when 'Norte'
        Directions::Norte.new
      when 'Este'
        Directions::Este.new
      when 'Sur'
        Directions::Sur.new
      when 'Oeste'
        Directions::Oeste.new
      end
    end
  end

  module MinBoolFuncNode
    def value
      false
    end
  end

  module MaxBoolFuncNode
    def value
      true
    end
  end

  module MinColorFuncNode
    def value
      Colors::Azul.new
    end
  end

  module MaxColorFuncNode
    def value
      Colors::Verde.new
    end
  end

  module MinDirFuncNode
    def value
      Directions::Norte.new
    end
  end

  module MaxDirFuncNode
    def value
      Directions::Oeste.new
    end
  end

  module VarNameNode
    def value
      Expressions::VarName.new text_value
    end
  end

  module NroBolitasFuncNode
    def value
      Functions::NroBolitas.new elements[1].value
    end
  end
end
