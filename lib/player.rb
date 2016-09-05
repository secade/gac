class Player
  WIDTH = ::UNIVERSAL::TILE_W
  HEIGHT = ::UNIVERSAL::TILE_H * 2

  VEL = ::UNIVERSAL::BASIC_VEL

  attr_reader = :window, :x, :y

  def initialize(window, start_x, start_y)
    @window = window
    @x, @y = start_x, start_y
    @drawable = ::Draw::Rectangle.new(window, :green, WIDTH, HEIGHT)
  end

  def update
  end

  def draw
    @drawable.draw(@x, @y)
  end
end
