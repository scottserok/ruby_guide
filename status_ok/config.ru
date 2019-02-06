require 'rack'
require './lib/status_ok'

run StatusOK.new
