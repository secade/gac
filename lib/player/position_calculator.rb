module Player
  module PositionCalculator
    class << self
      def update(x: , y: , vel_x: , vel_y: )
        x += vel_x
        y += vel_y
        [x, y]
      end
    end
  end
end
