require_relative '../engines'
# Used to store all static background objects- should contain NO
# entities of any kind. Eventually, will be superseded by a 'screen' or 'map'
# class that holds background objects, entities and actions

module Environment
  class Background

    ENGINE = Engines::Field

    attr_accessor :window, :player, :walls

    def initialize(window, player)
      @window = window
      @player = player
      @walls = []
      make_walls!
    end

    def update
      ENGINE.update(player, walls)
    end

    def draw
      @walls.each(&:draw)
    end

    private

    def make_walls!
      walls << Wall.new(window,
                        0, 0,
                        16, ::UNIVERSAL::HEIGHT,
                        :collide)
      walls << Wall.new(window,
                        ::UNIVERSAL::WIDTH - 16, 0,
                        16, ::UNIVERSAL::HEIGHT,
                        :collide)
    end
  end
end
