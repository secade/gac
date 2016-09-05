require_relative '../engines'
# Used to store all static background objects- should contain NO
# entities of any kind. Eventually, will be superseded by a 'screen' or 'map'
# class that holds background objects, entities and actions

module Environment
  class Background

    ENGINE = Engines::Field

    attr_accessor :window, :player, :platforms

    def initialize(window, player)
      @window = window
      @player = player
      @platforms = []
      make_platforms!
    end

    def update
      ENGINE.update(player, platforms)
    end

    def draw
      @platforms.each(&:draw)
    end

    private

    def make_platforms!
      platforms << Platform.new(window,
                        0, 0,
                        16, ::UNIVERSAL::HEIGHT)
      platforms << Platform.new(window,
                        ::UNIVERSAL::WIDTH - 16, 0,
                        16, ::UNIVERSAL::HEIGHT)
      platforms << Platform.new(window,
                        0, 0,
                        UNIVERSAL::WIDTH, 16, :gold)
      platforms << Platform.new(window,
                        0, UNIVERSAL::HEIGHT - 16,
                        UNIVERSAL::WIDTH, 16, :gold)
      platforms << Platform.new(window,
                        160, 140,
                        32, 32, :blue)
    end
  end
end
