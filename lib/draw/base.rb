require 'active_support'

# Handles instantiation of base drawable objects

module Draw
  class Base
    class DrawError < StandardError; end

    attr_reader :color

    def initialize(color)
      raise DrawError, "#{self.class} initialize not declared!"
    end

    private

    def set_color(color)
      unless COLORS.includes?(color)
        raise DrawError, "Declared Color '#{color}' for #{self.class} not found!"
      else
        @color = COLORS.get(color)
      end
    end
  end
end
