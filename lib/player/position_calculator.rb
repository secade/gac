module Player
  module PositionCalculator
    def self.update(x: , y: , vel_x: , vel_y: )
      x += vel_x % UNIVERSAL::WIDTH + Player::WIDTH
      y += vel_y % UNIVERSAL::HEIGHT + Player::HEIGHT
      [x, y]
    end
  end
end
