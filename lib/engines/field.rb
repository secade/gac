# Placeholder for collision detection on the map
#
# THIS IS CURRENTLY SUPER STUPID

module Engines
  module Field
    class << self
      def update(player, map)
        map.updateables.each(&:update)
        map.gravitizables.each(&:gravitize)
        run_collide(player, map)
      end

      private

      def run_collide(player, map)
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
