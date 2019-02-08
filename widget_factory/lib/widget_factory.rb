require 'sinatra'
require 'sqlite3'
require 'yaml'
require './lib/widget_factory/database'

ENV['RACK_ENV'] ||= 'development'

# Called when the web server receives HTTP GET /
# Retrieves all of the widgets in the database and renders lib/views/index.erb
get '/' do
  db = WidgetFactory::Database.new
  @widgets = db.all
  erb :index
end

# Called when the web server receives HTTP POST /
# Creates a new widget and send the user back to root path
post '/' do
  db = WidgetFactory::Database.new
  db.create name: params[:name], color: params[:color]
  redirect '/'
end
