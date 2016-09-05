require_relative 'movement'
require_relative 'position_calculator'

module Player
  WIDTH = ::UNIVERSAL::TILE_W
  HEIGHT = ::UNIVERSAL::TILE_H * 2

  class Core
    include Movement

    attr_accessor :window, :x, :y, :vel_x, :vel_y

    def initialize(window, start_x, start_y)
      @window = window
      @x, @y = start_x, start_y
      @vel_x, @vel_y = 0, 0
      @drawable = ::Draw::Rectangle.new(window, :green, WIDTH, HEIGHT)
    end

    def update
      @x, @y = PositionCalculator.update(
        x: x,
        y: y,
        vel_x: vel_x,
        vel_y: vel_y,
      )
    end

    def draw
      @drawable.draw(x, y)
    end

    def player_action(action)
      send action
    end
  end
end
