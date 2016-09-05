require 'gosu'
require 'active_support/all'
require 'pry'
require_relative 'constants'
require_relative 'controllers'
require_relative 'draw'
require_relative 'player'

class Window < Gosu::Window
  attr_reader :player

  delegate :player_action, to: :player
  delegate :window_action, to: self

  def initialize
    super ::UNIVERSAL::WIDTH, ::UNIVERSAL::HEIGHT
    caption = "Generic Ancient Civilization"

    @player = Player::Core.new(self, 320, 240)
    @controller = Controllers::Base.new(self)
  end

  def update
    [@player, @controller].each(&:update)
  end

  def draw
    @player.draw
  end

  def window_action(action)
    send action
  end

  def exit
    close
  end
end
