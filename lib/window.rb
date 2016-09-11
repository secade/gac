require 'gosu'
require 'active_support/all'
require 'pry'
require_relative 'constants'
require_relative 'controllers'
require_relative 'environment'
require_relative 'draw'
require_relative 'player'

class Window < Gosu::Window
  attr_reader :player, :pipeline

  delegate :player_action, to: :player
  delegate :window_action, to: self

  def initialize(pipeline)
    super ::UNIVERSAL::WIDTH, ::UNIVERSAL::HEIGHT
    caption = "Generic Ancient Civilization"

    @pipeline = pipeline
    @player = Player::Core.new(self, 320, 240)
    @map = Environment::Background.new(self, player)
    @controller = Controllers::Base.new(self)
  end

  def update
    [@map, @controller].each(&:update)
  end

  def draw
    [@map].each(&:draw)
  end

  def window_action(action)
    send action
  end

  def exit
    close
  end
end
