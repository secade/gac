module Player
  module Movement

    VEL = ::UNIVERSAL::BASIC_VEL
    MAX_VEL = 5.0

    def move_up
      vel_y < MAX_VEL ? @vel_y += VEL : @vel_y = MAX_VEL
    end

    def move_down
      vel_y > MAX_VEL ? @vel_y -= VEL : @vel_y = MAX_VEL
    end
  end
end
