require 'sinatra'
require 'sqlite3'
require 'yaml'
require './lib/widget_factory/database'

ENV['RACK_ENV'] ||= 'development'

# Show all of our widgets
get '/' do
  db = WidgetFactory::Database.new
  @widgets = db.all
  erb :index
end

# Create a new widget and send the user back to the home page
post '/' do
  db = WidgetFactory::Database.new
  db.create name: params[:name], color: params[:color]
  redirect '/'
end
