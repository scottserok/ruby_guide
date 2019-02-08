require './lib/widget_factory'
require 'minitest/autorun'
require 'rack/test'

ENV['RACK_ENV'] = 'test'

class WidgetFactoryTest < Minitest::Test
  include Rack::Test::Methods

  # Establish a database "connection" for our test setup, assertions, and
  # teardown
  def db
    @db ||= WidgetFactory::Database.new
  end

  # define the rack-test application
  def app
    Sinatra::Application
  end

  # test homepage HTTP GET /
  # Expect the server to respond HTTP 200 OK
  def test_root_get
    get '/'
    assert last_response.ok?
  end

  # test insert HTTP POST /?name=Bumble%20Bee%20Widget&color=yellow
  # Expect a widget to be created with the name and color provided
  def test_root_post
    # setup
    db.truncate!
    name = 'Bumble Bee Widget'
    color = 'yellow'
    # run the task
    post '/', name: name, color: color
    follow_redirect!
    # verify expectations
    assert last_response.ok?
    assert_equal 1, db.all.size
    widget = db.all.first
    assert_equal name, widget[0]
    assert_equal color, widget[1]
    # teardown
    db.truncate!
  end

  # test insert HTTP POST/?name=&color=
  # Expect no widget to be created without a name and color
  def test_root_post_empty
    # setup
    db.truncate!
    # run the task
    post '/', name: '', color: ''        # try insert with blank name and color
    post '/', name: 'A Name', color: ''  # try insert with blank color
    post '/', name: ' ', color: 'blue'   # try insert with blank name
    follow_redirect!
    # verify expectations
    assert last_response.ok?
    assert_equal 0, db.all.size
    # teardown
    db.truncate!
  end
end
