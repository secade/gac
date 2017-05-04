require_relative 'intelligences/moving_townsfolk'

module Entities
  class Townsfolk < Base

    attr_reader :brain

    def initialize(window, start_x: , start_y: , actions: [:move])
      @w, @h = 32, 32
      @x, @y = [start_x, start_y].map {|val| val * Maps::TILE_SIZE }
      drawable = Draw::Entity.new(window, w, h)
      super(window, x, y, drawable)
      @brain = Entities::Intelligences::MovingTownsfolk.new(self, actions: actions)
    end

    def update
      brain.update
      super
    end
  end
end
