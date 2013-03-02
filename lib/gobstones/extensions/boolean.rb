require 'gobstones/lang/literals/booleans'

class TrueClass

  def to_gbs_bool
    True.new
  end

end

class FalseClass

  def to_gbs_bool
    False.new
  end

end
