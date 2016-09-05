# Base class for handling all player input

module Controllers
  class Base
    MOVE_MAPPING = {
      input_move_left:  { key: 'KbLeft',  receiver: :player },
      input_move_right: { key: 'KbRight', receiver: :player },
    }.freeze

    WINDOW_MAPPING = {
      exit: { key: 'KbEscape', receiver: :window },
    }.freeze

    DEFAULT_MAPPING = MOVE_MAPPING.merge WINDOW_MAPPING

    attr_reader :window

    def initialize(window)
      @window = window
    end

    def update
      DEFAULT_MAPPING.each do |action, opts|
        if Gosu::button_down? "Gosu::#{opts[:key]}".constantize
          window.send "#{opts[:receiver]}_action".to_sym, action
        end
      end
    end

    def button_down(id)
      puts "PUSHED A BUTTON #{id}"
    end
  end
end
