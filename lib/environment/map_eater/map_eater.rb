require 'yaml'
require_relative '../../utils'

# Creates a map from a YAML specification

module Environment
  class MapEater
    extend Utils::ConstantHelpers

    MAX_W = ::UNIVERSAL::WIDTH_TILES
    MAX_H = ::UNIVERSAL::HEIGHT_TILES

    # return: Map
    def self.eat!(args)
      new(args).tap(&:eat!)
    end

    attr_accessor :window, :file

    def initialize(window: , path: )
      @window = window
      @file = YAML.load_file(path)
    end

    def eat!
      Map.new(window)
      file.each do |klass, list|
        Map.add_batch klass, list.map { |com| build_command(klass, com) }
      end
    end

    def build_command(klass, command)
      klass.constantize.new(formatter(command[:args]))
    end

    def formatter(args)
      args[:w] = args[:w].constantize unless args[:w].is_a?(String)
      args[:h] = args[:h].constantize unless args[:h].is_a?(String)
    end
  end
end
