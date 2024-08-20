=begin
P-----
Write a method that takes a string argument and returns a new string that
contains the original value of the argument with the first character of every
word capitalized and all other letters lowercase.

Rules:
- Assume that words are any sequence of non-blank characters.
- If input string contains capitalized words in any but the first character of
each word, it should be lowercase in the return string.

Input: a string
Return: a new string

E-----
word_cap('four score and seven') == 'Four Score And Seven'
word_cap('the javaScript language') == 'The Javascript Language'
word_cap('this is a "quoted" word') == 'This Is A "quoted" Word'

A-----
- Define a method with one parameter.
- Initialize local variable `new_string` to input string with all lowercase
characters.
- Convert `new_string` to an array of words.
  - Initialize local variable `transformed_words` to the return value of
  iterating through the array of words, performing transformation.
    - If the character at index 0 of the word is an alphabetic character,
    capitalize it.
- Join together the `array` with one whitespace in between each word.
  - Return the return value of this.

C-----
=end

def word_cap(string)
  new_string = string.downcase
  transformed_words = new_string.split.map do |word|
    if word[0] =~ /[a-z]/
      word[0].upcase + word[1..-1]
    else
      word
    end
  end
  transformed_words.join(' ')
end

p word_cap('four score and seven') == 'Four Score And Seven'
p word_cap('the javaScript language') == 'The Javascript Language'
p word_cap('this is a "quoted" word') == 'This Is A "quoted" Word'