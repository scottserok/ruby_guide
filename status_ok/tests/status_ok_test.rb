require './lib/status_ok'
require 'minitest/autorun'
require 'rack/test'

ENV['RACK_ENV'] = 'test'

class TestStatusOK < Minitest::Test
  include Rack::Test::Methods

  def app
    StatusOK.new
  end

  def test_status_ok
    get '/'
    assert last_response.ok?
    assert_equal last_response.body, 'OK'
  end

  def test_post_root
    post '/'
    assert last_response.method_not_allowed?
    assert_equal last_response.body, 'Method Not Allowed'
  end

  def test_get_resource
    get '/hello'
    assert last_response.not_found?
    assert_equal last_response.body, 'Not Found'
  end
end
