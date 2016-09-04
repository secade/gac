require 'gosu'
require 'active_support/all'
require 'pry'
require_relative 'constants'
require_relative 'player'
require_relative 'draw'

class Window < Gosu::Window
  def initialize
    super ::UNIVERSAL::WIDTH, ::UNIVERSAL::HEIGHT
    caption = "Generic Ancient Civilization"
    @player = Player.new(self, 320, 240)
  end

  def update
  end

  def draw
  end
end
