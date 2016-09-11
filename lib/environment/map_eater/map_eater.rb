require 'yaml'
require_relative '../../utils'

# Creates a map from a YAML specification

module Environment
  class MapEater

    # return: Map
    def self.eat!(args)
      new(args).eat!
    end

    attr_accessor :window, :file

    def initialize(window: , path: )
      @window = window
      @file = YAML.load_file(path)
    end

    def eat!
      map = Map.new(window)
      file.each do |klass, list|
        map.entities << list.map { |com| build_command(klass, com) }
      end
      map.entities.flatten!
      map
    end

    private

    def build_command(klass, command)
      obj = "Environment::#{klass}".constantize
      obj.factory(window, command[:args])
    end
  end
end
