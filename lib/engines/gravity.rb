module Engines
  module Gravity
    def gravity?
      true
    end

    def gravitize
      @vel_y += 1.8
    end
  end
end
