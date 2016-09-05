module Player
  module Movement

    VEL = 2.0
    MAX_VEL = 5.0

    def move_right
      vel_x <= MAX_VEL ? @vel_x += VEL : @vel_x = MAX_VEL
    end

    def move_left
      puts "#{x}: #{vel_x}, #{y}: #{vel_y}"
      vel_x >= -MAX_VEL ? @vel_x -= VEL : @vel_x = -MAX_VEL
    end
  end
end
