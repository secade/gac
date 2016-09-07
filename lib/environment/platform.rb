module Environment
  class Platform
    extend BaseEntity
    include Engines::Collidable

    attr_entity [:drawable, :collidable]

    attr_accessor :window, :x, :y, :h, :w

    def initialize(window, x: , y: , w: , h: , color: :blue)
      @window = window
      @x, @y, @w, @h = x, y, w, h
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
