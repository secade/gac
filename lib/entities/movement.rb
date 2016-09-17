# Series of actions callable from controller or interactive objects/entities

module Entities
  module Movement

    HOR_OFFSET = 2.0
    IMPULSE = 2.5
    MAX_VEL = 5.0
    MIN_VEL = 0.4
    DRAG = 0.85

    def update_movement
      calc_position
      @prev_pos, @prev_x, @prev_y = pos, x, y
      @x += vel_x
      @y += vel_y
      kill_jump_flag if kill_jump_flag?
      if vel_x.abs < MIN_VEL
        @vel_x = 0
      else
        @vel_x *= DRAG
      end
      @vel_y *= DRAG
    end

    def calc_position
      if prev_y.try(:round,3) != y.round(3)
        @pos = [:rs, :rw, :rj].include?(prev_pos) ? :rj : :lj
      elsif prev_x.round(3) == x.round(3)
        if prev_pos == :rw || prev_pos == :rj
          @pos = :rs
        elsif prev_pos == :lw || prev_pos == :lj
          @pos = :ls
        end
      else
        @pos = prev_x.try(:round,3) > x.round(3) ? :lw : :rw
      end
      # puts "DRAW #{pos} at #{vel_x}: #{prev_x}: #{x}, #{vel_y}: #{prev_y}: #{y}"
    end

    def _jump
      @vel_y = -MAX_VEL * 6.0
    end

    def kill_jump_flag?
      vel_y == 0 && @prev_y == @y && @prev_col != :top
    end

    def input_move_down
    end

    def input_move_right
      vel_x <= MAX_VEL ? @vel_x += IMPULSE : @vel_x = MAX_VEL
    end

    def input_move_left
      vel_x >= -MAX_VEL ? @vel_x -= IMPULSE : @vel_x = -MAX_VEL
    end

    def full_stop(collision)
      send "stop_from_#{collision.direction}", collision.offset
    end

    def stop_from_right(offset)
      # puts "right: #{offset}"
      @prev_col = :right
      @x += offset
      @vel_x = 0
    end

    def stop_from_left(offset)
      # puts "left: #{offset}"
      @prev_col = :left
      @x -= offset
      @vel_x = 0
    end

    def stop_from_top(offset)
      # puts "TOP: #{offset}"
      @prev_col = :top
      @y += offset
      @vel_y = 0
    end

    def stop_from_bottom(offset)
      @prev_col = :bottom
      @y -= offset
      @vel_y = 0
    end
  end
end
