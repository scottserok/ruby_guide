require 'minitest/autorun'  # require minitest library
require './lib/hello_world' # require our lib/hello_world.rb file

# minitest documentation tells us that our tests must be defined as
# methods inside of a subclass of Minitest::Test
class HelloWorldTest < Minitest::Test

  # test that the output of our method equals the string "Hello, World!"
  def test_hello_world
    assert_equal hello, "Hello, world!"
  end
end
