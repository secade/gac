module Environment
  class Map
    ENGINE = Engines::Field

    attr_reader :window

    def initialize(window)
      @window = window
    end

    def add_batch(klass, list)
      entities[klass] = list
    end

    def update
      updateables.each(&:update)
    end

    def draw
      drawables.each(&:draw)
    end

    def entities
      @entities ||= []
    end

    def drawables
      entities.select(&:drawable?)
    end

    def updateables
      entities.select(&:updateable?)
    end

    def collidables
      entities.select(&:collidable?)
    end

    def gravitizables
      entities.select(&:gravitizable?)
    end
  end
end
