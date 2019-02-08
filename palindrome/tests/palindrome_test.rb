require './lib/palindrome'
require 'minitest/autorun'

class TestPalindrome < Minitest::Test
  def test_palindrome
    word = 'racecar'
    assert_equal true, Palindrome.valid?(word)
  end

  def test_not_palindrome
    word = 'hello world'
    assert_equal false, Palindrome.valid?(word)
  end
end
