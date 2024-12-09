=begin
P-----
Write a method that takes a string argument containing one or more words, and
returns the given string with words that contain five or more characters reversed.

Rules:
- Each string consists of only letters and spaces.
- Spaces are included only when more than one word is present.
- This method is case-sensitive.

Input: a string
Return: same string, mutated

E-----
puts reverse_words('Professional')          # => lanoisseforP
puts reverse_words('Walk around the block') # => Walk dnuora the kcolb
puts reverse_words('Launch School')         # => hcnuaL loohcS

A-----
- Define a method `reverse_words` with one parameter `string`.
- Convert input `string` to an array of words.
- Iterate through the array of words, performing transformation.
  - If the size of the current word is five or greater, reverse the letters of
  the word. Return this word.
  - Otherwise, return the current word.
- Join the elements of the array on one whitespace. Return the returned string.

C-----
=end

def reverse_words(string)
  words = []

  string.split.each do |word|
    word.reverse! if word.size >= 5
    words << word
  end

  words.join(' ')
# string.split.map do |word|
#   word.size >= 5 ? word.reverse : word
# end.join(' ')
end

p reverse_words('Professional')          # => lanoisseforP
p reverse_words('Walk around the block') # => Walk dnuora the kcolb
p reverse_words('Launch School')         # => hcnuaL loohcS