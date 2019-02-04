require './lib/palindrome'
require 'minitest/autorun'

class TestPalindrome < Minitest::Test
  def test_palindrome
    word = 'racecar'
    assert_equal Palindrome.valid?(word), true
  end

  def test_not_palindrome
    word = 'hello world'
    assert_equal Palindrome.valid?(word), false
  end
end
