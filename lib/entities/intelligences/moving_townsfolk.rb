module Entities
  module Intelligences
    class MovingTownsfolk
      extend Utils::ActionHelpers

      timer :move, length: 30, randomization: 50

      attr_reader :parent, :dir

      def initialize(parent)
        @parent = parent
      end

      def update
        move
        update_timers
      end

      def _move
        parent.send("input_move_#{['right','left'].sample}")
      end
    end
  end
end
