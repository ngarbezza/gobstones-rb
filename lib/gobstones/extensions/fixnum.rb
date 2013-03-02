require 'gobstones/lang/literals/number'

class Fixnum

  def to_gbs_num
    Number.new self
  end

end
