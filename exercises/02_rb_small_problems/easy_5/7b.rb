# P-----------
# Modify the `word_sizes` method from the previous exercise to exclude non-letters
# when determining word size.

# Input: a string
# Output: a hash

# Explicit:
# - "it's" has a length of 3, not 4.

# E-----------
# word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 2 }
# word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 3 }
# word_sizes("What's up doc?") == { 5 => 1, 2 => 1, 3 => 1 }
# word_sizes('') == {}

# D-----------

# A-----------
# 1. Define a method `word_sizes` that takes one parameter.
# 2. Delete all punctuation marks from input string and save return value in a
# new variable.
# 3. Convert input string into an array.
# 4. Iterate through the array, returning a new array with the length of each string.
# 5. Initialize a hash with keys as the length of each string and values as the
# frequency of each length in the array.
# 6. Return hash from Step 4.

# C-------------
def no_punctuation(sentence)
  sentence.delete('^a-zA-z" "')
end

def determine_word_length(sentence)
  sentence.split.map do |word|
    word.length
  end
end

def word_sizes(sentence)
  hash_lengths = {}
  no_punctuation_sentence = no_punctuation(sentence)
  length_array = determine_word_length(no_punctuation_sentence)
  length_array.each do |length|
     hash_lengths[length] = length_array.count(length)
   end
  hash_lengths
end

p word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 2 }
p word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 3 }
p word_sizes("What's up doc?") == { 5 => 1, 2 => 1, 3 => 1 }
p word_sizes('') == {}