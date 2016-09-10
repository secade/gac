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

    attr_reader :window, :w, :h

    delegate :draw_ls, to: :ls
    delegate :draw_rs, to: :rs
    delegate :draw_lw, to: :lw
    delegate :draw_rw, to: :rw
    delegate :draw_lj, to: :lj
    delegate :draw_rj, to: :rj

    def initialize(window, width, height)
      @window = window
      @w, @h = width, height
      prepare_sprites
    end

    def draw(x, y, pos = :rs)
      send "draw_#{pos}"
    end

    private

    def prepare_sprites
      @ls = ::Draw::Rectangle.new(window, :orange, WIDTH, HEIGHT)
      @rs = ::Draw::Rectangle.new(window, :purple, WIDTH, HEIGHT)
      @lw = ::Draw::Rectangle.new(window, :red, WIDTH, HEIGHT)
      @rw = ::Draw::Rectangle.new(window, :green, WIDTH, HEIGHT)
      @lj = ::Draw::Rectangle.new(window, :gold, WIDTH, HEIGHT)
      @rj = ::Draw::Rectangle.new(window, :blue, WIDTH, HEIGHT)
    end

    def draw_ls
    end

    def draw_rs
    end
  end
end
