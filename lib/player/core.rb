require_relative 'movement'
require_relative 'position_calculator'
require_relative '../engines/collidable'

module Player
  WIDTH = ::UNIVERSAL::TILE_W
  HEIGHT = ::UNIVERSAL::TILE_H * 2

  class Core
    include Movement
    include Engines::Collidable

    attr_accessor :window, :x, :y, :vel_x, :vel_y, :w, :h

    def initialize(window, start_x, start_y)
      @window = window
      @x, @y = start_x, start_y
      @w, @h = WIDTH, HEIGHT
      @vel_x, @vel_y = 0, 0
      # puts "#{x}: #{vel_x}, #{y}: #{vel_y}"
      @left_rec = ::Draw::Rectangle.new(window, :red, WIDTH, HEIGHT)
      @right_rec = ::Draw::Rectangle.new(window, :green, WIDTH, HEIGHT)
      @drawable = @right_rec
    end

    def update
      calc_move
    end

    def draw
      @drawable.draw(x, y)
    end

    def player_action(action)
      send action
    end

    def collide!(collision)
      send collision.action, collision
    end
  end
end
