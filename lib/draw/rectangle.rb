module Draw
  class Rectangle < Base

    attr_reader :window, :w, :h

    def initialize(window, color, width, height)
      @window = window
      set_color(color)
      @w, @h = width, height
    end

    def draw(x, y)
      window.draw_quad(
        x, y, color,
        x + w, y, color,
        x, y + h, color,
        x + w, y + h, color
      )
    end
  end
end
