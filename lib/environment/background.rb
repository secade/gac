require_relative '../engines'
require_relative 'map_eater'

module Environment
  class Background

    ENGINE = Engines::Field

    delegate :draw, to: :map

    attr_accessor :window, :map, :player

    def initialize(window, player)
      @window = window
      @player = player
      @map = MapEater.eat!(window: window, path: 'assets/maps/base.yaml')
    end

    def update
      ENGINE.update(player, map)
    end
  end
end
