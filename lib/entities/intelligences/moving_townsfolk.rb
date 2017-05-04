module Entities
  module Intelligences
    class MovingTownsfolk
      extend Utils::ActionHelpers

      timer :move, length: 30, randomization: 50
      timer :jump, length: 120, randomization: 120

      attr_reader :parent, :actions

      def initialize(parent, actions: )
        @parent = parent
        @actions = actions
      end

      def update
        actions.each { |a| self.send(a) }
        update_timers
      end

      def _move
        parent.send("input_move_#{['right','left'].sample}")
      end

      def _jump
        parent._jump
      end
    end
  end
end
