require 'active_support'

# Handles instantiation of base drawable objects

module Draw
  extend ActiveSupport::Concern
  extend ActiveSupport::Inflector

  class Base
    class DrawError < StandardError; end

    def initialize(color)
      set_color(color)
    end

    private

    def set_color(color)
      unless COLORS.include?(color)
        raise DrawError, "Declared Color '#{color}' for #{self.class} not found!"
      else
        @color = COLORS.get(color)
      end
    end
  end
end
