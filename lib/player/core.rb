require_relative '../entities/movement'
require_relative '../engines/collidable'

module Player
  class Core < Entities::Base
    def initialize(window, start_x, start_y)
      @window = window
      @x, @y = start_x, start_y
      @w, @h = 32, 64
      @vel_x, @vel_y = 0, 0
      @pos = :rs
      @drawable = Draw::Entity.new(window, w, h)
    end

    def update
      update_movement
    end

    def draw
      @drawable.draw(x, y, pos)
    end

    def player_action(action)
      send action
    end
  end
end
