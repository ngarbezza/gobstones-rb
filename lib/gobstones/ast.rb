module Gobstones

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
end
