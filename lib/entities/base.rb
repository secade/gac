require_relative 'movement'

# Base class for an empty, stupid entity. Will eventually be inherited
# by NPCs and monsters
# Difference between NPCs and Monsters is primarily in rendering and AI or interactibility

module Entities
  class Base
    extend Environment::BaseObject
    include Entities::Movement
    include Engines::Collidable
    include Engines::Gravity
    extend Utils::ActionHelpers

    action_flag :jump

    attr_entity [:updateable, :drawable, :gravitizable, :collidee]

    attr_accessor :window, :x, :y, :vel_x, :vel_y, :w, :h, :pos, :prev_x, :prev_y, :prev_pos

    def initialize(window, start_x, start_y, drawable)
      @window = window
      @x, @y = start_x, start_y
      @w, @h = 32, 32
      @vel_x, @vel_y = 0, 0
      @pos = :rs
      @drawable = drawable
    end

    def update
      update_movement
    end

    def draw
      @drawable.draw(x, y, pos)
    end

    def collide!(collision)
      send collision.action, collision
    end
  end
end
