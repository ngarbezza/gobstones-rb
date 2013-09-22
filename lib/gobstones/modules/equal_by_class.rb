module Gobstones

  module EqualByClass

    def ==(other)
      self.class == other.class
    end

    alias_method :eql?, :==

  end

end