# P-------------
# Write a method that takes a string with one or more space-separated words and
# returns a hash that shows the number of words of different sizes.

# Input: a string
# Output: a hash

# Explicit:
# - Words consist of any string of characters that don't include a space.

# Implicit:
# - If input string is empty, return an empty hash.
# - Puncuation marks count as part of the string.

# E-------------
# word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 1, 6 => 1 }
# word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 1, 7 => 2 }
# word_sizes("What's up doc?") == { 6 => 1, 2 => 1, 4 => 1 }
# word_sizes('') == {}

# D-------------

# A-------------
# 1. Define a method `word_sizes` that takes one parameter.
# 2. Convert input string into an array.
# 3. Iterate through the array, returning a new array with the length of each string.
# 4. Initialize a hash with keys as the length of each string and values as the
# frequency of each length in the array.
# 5. Return hash from Step 4.

# C-------------
def determine_word_length(sentence)
  sentence.split.map do |word|
    word.length
  end
end

def word_sizes(sentence)
  hash_lengths = {}
  length_array = determine_word_length(sentence)
  length_array.each do |length|
    hash_lengths[length] = length_array.count(length)
  end
  hash_lengths
end

p word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 1, 6 => 1 }
p word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 1, 7 => 2 }
p word_sizes("What's up doc?") == { 6 => 1, 2 => 1, 4 => 1 }
p word_sizes('') == {}