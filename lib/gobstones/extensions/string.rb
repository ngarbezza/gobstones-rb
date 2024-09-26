# frozen_string_literal: true

require 'gobstones/lang/expressions/var_name'

class String
  def to_var_name
    Gobstones::Lang::VarName.new(self)
  end
end
