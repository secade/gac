# Environmental holder for songs used in BGM- no sound FX here.
# Used to control various effects that occur on music such as fades

module Environment
  class Song
    extend BaseEntity

    attr_entity [:updateable]

    attr_reader :song

    def initialize(window, filename: )
      @filename = filename
      @song = window.get_asset(type: :song, name: filename)
      song.play(true)
    end

    def update
      # empty for now but used for handling FX later
    end
  end
end
