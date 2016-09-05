# Small DSL for creating a timer
# Extend the class in order to add instance method helpers
# for easily spinning up timers that you can time to actions

module Utils
  module ActionHelpers
    def timer(method, opts)
      class_eval <<-RUBY
        # Checks if there's an active timer for this method
        # If not, call the defined action and start a timer
        # If there is, do nothing.
        def #{method}
          unless #{method}_time_left?
            _#{method}
            _timers << Utils::Timer.new(type: :#{method}, ticks: #{opts[:length]})
          end
        end

        def #{method}_time_left?
          _timers.any? {|t| t.of_type?(:#{method}) }
        end

        def kill_#{method}_timer!
          _timers.reject! {|t| t.of_type?(:#{method}) }
        end

        def _timers
          @_timers ||= []
        end

        def update_timers
          _timers.each(&:update)
          _timers.keep_if(&:time_left?)
        end
      RUBY
    end

    def action_flag(method)
      class_eval <<-RUBY
        def #{method}
          unless #{method}_flag_on?
            _#{method}
            _flags << :#{method}
          end
        end

        def #{method}_flag_on?
          _flags.any? {|f| f == :#{method} }
        end

        def _flags
          @_flags ||= []
        end

        def kill_#{method}_flag
          _flags.reject! {|f| f == :#{method} }
        end
      RUBY
    end
  end
end
