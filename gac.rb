ROOT = File.dirname(__FILE__)

require_relative 'lib/assets'
require_relative 'lib/window'

puts "Game running."

pipeline = Assets::Pipeline.load!

window = Window.new(pipeline)
window.show
