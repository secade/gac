module Entities
  class Monster < Base
    def initialize(window, start_x: , start_y: )
      @w, @h = 32, 32
      @x, @y = [start_x, start_y].map {|val| val * Maps::TILE_SIZE }
      drawable = Draw::Entity.new(window, w, h)
      super(window, x, y, drawable)
    end
  end
end
