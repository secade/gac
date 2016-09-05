require_relative '../engines'
require_relative 'field_entity_helpers'

# Used to store all static background objects- should contain NO
# entities of any kind. Eventually, will be superseded by a 'screen' or 'map'
# class that holds background objects, entities and actions

module Environment
  class Background
    include FieldEntityHelpers

    ENGINE = Engines::Field

    attr_accessor :window, :all_entities, :player, :platforms

    def initialize(window, player)
      @window = window
      @player = player
      @platforms = []
      make_platforms!
      @all_entities = [player, platforms].flatten
    end

    def update
      ENGINE.update(self)
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
                        260, 340,
                        64, 64, :blue)
    end
  end
end
