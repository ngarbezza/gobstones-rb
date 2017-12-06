require 'gobstones/lang/literals/number'

class Integer
  def to_gbs_num
    Gobstones::Lang::Number.new(self)
  end
end
