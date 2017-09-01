require "sinatra"
require "sinatra/reloader" if development?
require "./controllers/statics_controller.rb"
require "./controllers/videos_controller.rb"

use Rack::MethodOverride

use StaticsController
run VideosController