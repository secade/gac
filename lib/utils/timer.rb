module Utils
  class Timer
    attr_reader :ticks, :type

    def initialize(type: , ticks: )
      @type = type
      @ticks = ticks
    end

    def of_type?(input)
      type == input
    end

    def update
      @ticks -= 1
    end

    def time_left?
      ticks >= 0
    end
  end
end
