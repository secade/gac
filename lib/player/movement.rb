# Series of actions callable from controller or interactive objects/entities

module Player
  module Movement

    HOR_OFFSET = 2.0
    IMPULSE = 2.5
    MAX_VEL = 5.0
    MIN_VEL = 1.50
    DRAG = 0.85

    def update_movement
      @x += vel_x
      @y += vel_y
      @vel_x *= DRAG
      @vel_y *= DRAG
    end

    def input_move_up
      @drawable = @up_rec
      vel_y >= -MAX_VEL ? @vel_y -= IMPULSE : @vel_y = -MAX_VEL
    end

    def input_move_down
      @drawable = @down_rec
      vel_y <= MAX_VEL ? @vel_y += IMPULSE : @vel_y = MAX_VEL
    end

    def input_move_right
      @drawable = @right_rec
      vel_x <= MAX_VEL ? @vel_x += IMPULSE : @vel_x = MAX_VEL
    end

    def input_move_left
      @drawable = @left_rec
      vel_x >= -MAX_VEL ? @vel_x -= IMPULSE : @vel_x = -MAX_VEL
    end

    def full_stop(collision)
      send "stop_from_#{collision.direction}", collision.offset
    end

    def stop_from_right(offset)
      @x += offset
      @vel_x = 0
    end

    def stop_from_left(offset)
      @x -= offset
      @vel_x = 0
    end

    def stop_from_top(offset)
      @y += offset
      @vel_y = 0
    end

    def stop_from_bottom(offset)
      @y -= offset
      @vel_y = 0
    end
  end
end
