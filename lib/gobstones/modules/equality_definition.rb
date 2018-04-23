module Gobstones
  module EqualityDefinition
    def ==(other)
      class_is_equal?(other) && attributes_are_equal?(other)
    end

    def equality_attributes
      []
    end

    alias_method :eql?, :==

    private

    def class_is_equal?(other)
      self.class == other.class
    end

    def attributes_are_equal?(other)
      equality_attributes.all? { |attr| send(attr) == other.send(attr) }
    end
  end
end
