# Placeholder for collision detection on the map
#
# THIS IS CURRENTLY SUPER STUPID

module Engines
  module Field
    class << self
      def update(player, map)
        run_gravity(map)
        run_collide(player, map)
      end

      private

      def run_gravity(map)
        map.gravitizables.each(&:gravitize)
      end

      def run_collide(play, map)
        collidables = map.collidables - [player]

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
