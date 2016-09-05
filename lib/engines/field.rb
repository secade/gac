# Placeholder for collision detection on the field
#
# THIS IS CURRENTLY SUPER STUPID

module Engines
  module Field
    class << self
      def update(field)
        run_gravity(field)
        run_collide(field)
      end

      def run_gravity(field)
        field.gravitizables.each(&:gravitize)
      end

      def run_collide(field)
        player = field.player
        collidables = field.collidables - [player]

        collidables.each do |c|
          if collision = player.check_collision(c)
            collision.action = c.collided_action
            player.collide!(collision)
          end
        end
      end
    end
  end
end
