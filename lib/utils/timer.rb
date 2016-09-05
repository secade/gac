# Small DSL for creating a timer
# Extend the class in order to add instance method helpers
# for easily spinning up timers that you can time to actions

module Utils
  module AutoTimer
    def timer(method, opts)
      class_eval <<-RUBY
        # Checks if there's an active timer for this method
        # If not, call the defined action and start a timer
        # If there is, do nothing.
        def #{method}
          unless #{method}_time_left?
            _#{method}
            _timers << Utils::Timer.new(type: :#{method}, ticks: #{opts[:length]})
          else
        end

        def #{method}_time_left?
          _timers.any? {|t| t.type == :#{method} }
        end
      RUBY

      def _timers
        @_timers ||= []
      end

      def update_timers
        _timers.each(&:update)
        _timers.keep_if(&:time_left?)
      end
    end
  end

  class Timer
    attr_reader :ticks, :type

    def initialize(type: , ticks: )
      @type = type
      @ticks = ticks
    end

    def update
      @ticks -= 1
    end

    def time_left?
      ticks >= 0
    end
  end
end
