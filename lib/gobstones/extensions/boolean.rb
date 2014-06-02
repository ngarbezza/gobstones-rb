require 'gobstones/lang/literals/booleans'

class TrueClass

  def to_gbs_bool
    Gobstones::Lang::True.new
  end

end

class FalseClass

  def to_gbs_bool
    Gobstones::Lang::False.new
  end

end
