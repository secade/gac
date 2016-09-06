require_relative '../utils'
require_relative 'universal'

module Maps
  extend Utils::ConstantHelpers

  TILE_SIZE = ::UNIVERSAL::TILE_SIZE

  MAX_W = ::UNIVERSAL::WIDTH_TILES
  MAX_H = ::UNIVERSAL::HEIGHT_TILES
  MAX_X = MAX_W - 1
  MAX_Y = MAX_H - 1
end
