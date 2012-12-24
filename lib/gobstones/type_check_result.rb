module Gobstones

  class TypeCheckResult

    def initialize(expected, actual)
      @expected = expected
      @actual = actual
    end

    def ok?
      @expected == @actual
    end

  end

end
