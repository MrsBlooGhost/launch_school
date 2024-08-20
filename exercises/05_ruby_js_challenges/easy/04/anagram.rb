=begin
--- P
Task: Select the sublist that contains the anagrams of the word.
Input: a word and a list of possible anagrams --- string and an array of strings
Return: a list that contains anagrams of the given word --- an array of string/s

Rules:
- the exact word is not an anagram
- case-insensitive
--- E

--- D

--- A
class `Anagram`

constructor
- accepts an anagram (string) as argument

instance method `match`
- accepts an array of possible anagrams (array of strings) as argument
- downcase given word, convert to array of chars, and sort, save in local variable `sorted_word`
- iterate through array, performing selection
  - if current word, downcased, converted to chars, and sorted, is equal to our `sorted_word` AND is not equal to the original word, select it
- returns a new array of selected words that are anagrams of given word
=end

class Anagram
  def initialize(word)
    @word = word
  end

  def match(candidates)
    word = @word.downcase.chars.sort

    candidates.select do |candidate|
      (word == candidate.downcase.chars.sort) && not_same_word?(candidate)
    end
  end

  private

  def not_same_word?(candidate)
    @word.downcase != candidate.downcase
  end
end
