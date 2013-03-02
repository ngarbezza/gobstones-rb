require 'gobstones/lang/literals/number'

class Fixnum

  def as_gbs_num
    Number.new self
  end

end
