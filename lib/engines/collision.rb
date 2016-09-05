# Stores data from a collision

module Engines
  class Collision

    attr_accessor :action
    attr_reader :direction, :offset

    def initialize(direction, offset)
      @direction = direction
      @offset = offset
    end
  end
end
