# Code for pre-loading core assets at game run
# All references to music/art should be through the pipeline- do NOT fresh
# load any assets into memory directly from the files- this is a memory issue!
#
# TODO: this is only currently for sounds

module Assets
  class Pipeline
    ASSETS_ROOT = File.join(ROOT,'assets')
    IMAGE_ROOT  = File.join(ASSETS_ROOT,'images/*')
    SOUND_ROOT  = File.join(ASSETS_ROOT,'sounds/*.wav')

    def self.load!
      self.new.load!
    end

    attr_reader :song

    def initialize
      @song = {}
    end

    def get_asset(type:, name:)
      send(type)[name]
    end

    def load!
      Dir[SOUND_ROOT].each(&load_asset!)
      self
    end

    def load_asset!
      lambda do |f|
        @song[name_only(f)] = Gosu::Song.new(f)
      end
    end

    def name_only(path)
      path.split('/').last
    end
  end
end
