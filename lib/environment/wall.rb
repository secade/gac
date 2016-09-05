module Environment
  class Wall
    include Engines::Collidable

    attr_accessor :window, :x, :y, :h, :w

    # collidable will contain an event that happens upon collision (like map change)
    # but stub out for now assuming they simply block movement
    def initialize(window, start_x, start_y, width, height, collidable)
      @window = window
      @x, @y = start_x, start_y
      @h, @w = height, width
      @drawable = ::Draw::Rectangle.new(window, :blue, w, h)
    end

    def draw
      @drawable.draw(x, y)
    end

    def collided_action
      # different walls may have different actions but always stop movement for now
      :full_stop
    end
  end
end
