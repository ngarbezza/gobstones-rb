# frozen_string_literal: true

module Gobstones
  module EqualityDefinition
    def ==(other)
      instance_of?(other.class) && attributes_are_equal?(other)
    end

    def equality_attributes
      []
    end

    alias_method :eql?, :==

    private

    def attributes_are_equal?(other)
      equality_attributes.all? { |attr| send(attr) == other.send(attr) }
    end
  end
end
