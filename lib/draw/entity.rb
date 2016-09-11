# Entities are expected to have the following positions defined:
#
# ls = left stand
# rs = right stand
# lw = left walk
# rw = right walk
# lj = left jump
# rj = right jump

module Draw
  class Entity < Base

    attr_reader :window, :w, :h, :ls, :rs, :lw, :rw, :lj, :rj

    def initialize(window, width, height)
      @window = window
      @w, @h = width, height
      prepare_sprites
    end

    def draw(x, y, pos = :rs)
      send(pos).draw(x, y)
    end

    private

    def prepare_sprites
      @ls = ::Draw::Rectangle.new(window, :orange, w, h)
      @rs = ::Draw::Rectangle.new(window, :purple, w, h)
      @lw = ::Draw::Rectangle.new(window, :red, w, h)
      @rw = ::Draw::Rectangle.new(window, :green, w, h)
      @lj = ::Draw::Rectangle.new(window, :gold, w, h)
      @rj = ::Draw::Rectangle.new(window, :blue, w, h)
    end
  end
end
