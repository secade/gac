module Environment
  class Platform
    include Engines::Collidable

    attr_accessor :window, :x, :y, :h, :w

    def initialize(window, start_x, start_y, width, height, color = :blue)
      @window = window
      @x, @y = start_x, start_y
      @h, @w = height, width
      @drawable = ::Draw::Rectangle.new(window, color, w, h)
    end

    def draw
      @drawable.draw(x, y)
    end

    def collided_action
      :full_stop
    end
  end
end
