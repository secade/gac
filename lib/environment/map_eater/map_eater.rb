require 'yaml'

# Creates a map from a YAML specification

module Environment
  class MapEater

    def self.eat!(*args)
      new(*args).maperate
    end

    attr_accessor :window

    def initialize(window: , path: )
      @window = window
      @file = File.open(path)
    end

    def maperate

    end
  end
end
