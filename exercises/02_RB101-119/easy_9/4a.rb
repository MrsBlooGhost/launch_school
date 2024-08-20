=begin
P-----
Write a method that takes a string argument, and returns an array containing every
word from the string, to which is appended a space and a word length.

Rules:
- Punctuation is counted.
- A word consists of characters. Words are separated by spaces.
- Case-sensitive

Input: a string
Return: an array

E-----
word_lengths("cow sheep chicken") == ["cow 3", "sheep 5", "chicken 7"]

word_lengths("baseball hot dogs and apple pie") ==
  ["baseball 8", "hot 3", "dogs 4", "and 3", "apple 5", "pie 3"]

word_lengths("It ain't easy, is it?") == ["It 2", "ain't 5", "easy, 5", "is 2", "it? 3"]

word_lengths("Supercalifragilisticexpialidocious") ==
  ["Supercalifragilisticexpialidocious 34"]

word_lengths("") == []

A-----
- Define a method `word_lengths` with one parameter `string`.
- Split `string` into an array of strings.
- Iterate through the array, performing transformation:
  - Return a string consisting of the word, a space, and an integer representing
  the size of the word.
- Return the transformed array.
C-----
=end

def word_lengths(string)
  string.split.map { |word| "#{word} #{word.size}"}
end

p word_lengths("cow sheep chicken") == ["cow 3", "sheep 5", "chicken 7"]

p word_lengths("baseball hot dogs and apple pie") ==
  ["baseball 8", "hot 3", "dogs 4", "and 3", "apple 5", "pie 3"]

p word_lengths("It ain't easy, is it?") == ["It 2", "ain't 5", "easy, 5", "is 2", "it? 3"]

p word_lengths("Supercalifragilisticexpialidocious") ==
  ["Supercalifragilisticexpialidocious 34"]

p word_lengths("") == []