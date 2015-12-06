require 'gobstones/lang/literals/number'

class Fixnum

  def to_gbs_num
    Gobstones::Lang::Number.new(self)
  end

end
