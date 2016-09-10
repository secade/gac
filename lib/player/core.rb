require_relative 'movement'
require_relative 'position_calculator'
require_relative '../engines/collidable'

module Player
  WIDTH = 32
  HEIGHT = 62

  class Core
    extend Environment::BaseEntity
    include Movement
    include Engines::Collidable
    include Engines::Gravity
    extend Utils::ActionHelpers

    attr_entity [:updateable, :drawable, :gravitizable]

    action_flag :jump

    attr_accessor :window, :x, :y, :vel_x, :vel_y, :w, :h

    delegate :draw, to: :drawable

    def initialize(window, start_x, start_y)
      @window = window
      @x, @y = start_x, start_y
      @w, @h = WIDTH, HEIGHT
      @vel_x, @vel_y = 0, 0
      @drawable = Draw::Entity.new(window, w, h)
    end

    def update
      update_movement
    end

    def player_action(action)
      send action
    end

    def collide!(collision)
      send collision.action, collision
    end
  end
end
