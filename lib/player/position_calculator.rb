module Player
  module PositionCalculator
    # LEFT_BOUND = ::UNIVERSAL::TILE_W
    # RIGHT_BOUND = ::UNIVERSAL::WIDTH - ::UNIVERSAL::TILE_W
    # VEL_OFFSET = Player::Movement::MAX_VEL

    class << self
      def update(x: , y: , vel_x: , vel_y: )
        y += vel_y
        [calc_x(x, vel_x), y]
      end

      private

      def calc_x(x, vel_x)
        # if x > RIGHT_BOUND
        #   x = RIGHT_BOUND + VEL_OFFSET
        # elsif x < LEFT_BOUND
        #   x = LEFT_BOUND - VEL_OFFSET
        # else
          x += vel_x
        # end
      end
    end
  end
end
