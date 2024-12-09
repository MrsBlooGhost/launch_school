# P-----------
# Write a method that takes a string of words and returns a string in which the
# first and last letters of every word are swapped.

# Input: a string
# Output: a new string

# Explicit:
# - Assume that every word contains at least one letter.
# - Assume the string contains at least one word.
# - Assume that each string contains just words and spaces.


# E-----------
# swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
# swap('Abcde') == 'ebcdA'
# swap('a') == 'a'

# D-----------

# A-----------
# 1. Define a method `swap` that takes one parameter.
# 2. Convert input string into an array with each word as an element.
# 3. Replace first letter with last letter.
# 4. Replace last letter with first letter.
# 5. Convert array to string, with spaces in between each word.
# 6. Return string from Step 5.

# C-----------
def swap(string)
  reversed_words = string.split(" ").map do |word|
    word.length > 1 ? word[-1] + word[1..-2] + word[0] : word
  end
  reversed_words.join(' ')
end

p swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
p swap('Abcde') == 'ebcdA'
p swap('a') == 'a'