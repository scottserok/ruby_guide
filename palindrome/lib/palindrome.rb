module Palindrome
  def self.valid?(word)
    if word == word.reverse
      false
    else
      true
    end
  end
end
