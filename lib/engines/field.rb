# Placeholder for collision detection on the field
#
# THIS IS CURRENTLY SUPER STUPID

module Engines
  module Field
    def self.update(player, collidables)
      collidables.each do |c|
        if collision = player.check_collision(c)
          collision.action = c.collided_action
          player.collide!(collision)
        end
      end
    end
  end
end
