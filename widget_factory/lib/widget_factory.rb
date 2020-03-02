require 'logger'
require 'sinatra'
require 'singleton'
require 'sqlite3'
require 'yaml'
require './lib/widget_factory/database'

ENV['RACK_ENV'] ||= 'development'

set :logging, Integer(ENV.fetch('LOG_LEVEL', '0'))

# Called when the web server receives HTTP GET /
# Retrieves all of the widgets in the database and renders lib/views/index.erb
get '/' do
  logger.debug('GET') { "params=#{params}" }
  db = WidgetFactory::Database.instance
  @widgets = db.all
  erb :index
end

# Called when the web server receives HTTP POST /
# Creates a new widget and send the user back to root path
post '/' do
  logger.debug('POST') { "params=#{params}" }
  name = params[:name].to_s
  color = params[:color].to_s.strip
  logger.debug { "name=#{name} color=#{color}" }
  if name.empty? || color.empty?
    logger.error 'Invalid parameters'
  else
    logger.info 'Creating widget'
    db = WidgetFactory::Database.instance
    db.create name: name, color: color
  end
  redirect '/'
end
