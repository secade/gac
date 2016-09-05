# Series of actions callable from controller or interactive objects/entities

module Player
  module Movement

    HOR_OFFSET = 2.0
    VEL = 1.5
    MAX_VEL = 5.0

    def move_right
      @drawable = @right_rec
      vel_x <= MAX_VEL ? @vel_x += VEL : @vel_x = MAX_VEL
    end

    def move_left
      @drawable = @left_rec
      vel_x >= -MAX_VEL ? @vel_x -= VEL : @vel_x = -MAX_VEL
    end

    def full_stop(collision)
      puts "FULL HORIZONTAL STOP BITCH WITH #{collision}:: " \
        "#{x}: #{vel_x}, #{y}: #{vel_y}"
      send "stop_from_#{collision.direction}", collision.offset
    end

    def stop_from_right(offset)
      @x += offset
      vel_x = 0
    end

    def stop_from_left(offset)
      @x -= offset
      vel_x = 0
    end

    def stop_from_top(offset)
    end

    def stop_from_bottom(offset)
    end
  end
end
