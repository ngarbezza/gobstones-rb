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
end
