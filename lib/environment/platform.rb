module Environment
  class Platform
    include Engines::Collidable

    attr_accessor :window, :x, :y, :h, :w

    def initialize(window, x: , y: , w: , height: , color: :blue)
      @window = window
      @x, @y = x, y
      @h, @w = height, width
      @drawable = ::Draw::Rectangle.new(window, color, w, h)
    end

    def draw
      @drawable.draw(x, y)
    end

    def collided_action
      :full_stop
    end

    def gravity?
      false
    end
  end
end
