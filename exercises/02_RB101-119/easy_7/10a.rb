=begin
P-----
Write a method that returns the next to last word in the string passed as an
argument.

Rules:
- Words are any sequence of non-blank characters.
- Assume that the input string contains at least two words.

E-----
penultimate('last word') == 'last'
penultimate('Launch School is great!') == 'is'

A-----
- Define a method `penultimate` with one parameter.
- Convert input string to an array of words.
- Return the element at index -2 of the array.

C-----
=end

def penultimate(string)
  string.split[-2]
end

p penultimate('last word') == 'last'
p penultimate('Launch School is great!') == 'is'