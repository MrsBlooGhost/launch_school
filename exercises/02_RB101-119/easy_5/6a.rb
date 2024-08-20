# Problem Description:


# ---------------- Problem (establish rules, define boundaries) ----------------
# Re-write the problem statement.
# Given a string with one or more space-separated words, write a method that
# returns a hash that shows the number of words of different sizes.

# Input: a string
# Output: a hash

# Rules
# Explicit:
# - A word is any string of characters that does not include a space.

# Implicit:
# - Punctuation marks count as part of the word.
# - A empty string does not contain any words.

# ---------------- Examples (confirm/refute assumptions ----------------
# word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 1, 6 => 1 }
# word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 1, 7 => 2 }
# word_sizes("What's up doc?") == { 6 => 1, 2 => 1, 4 => 1 }
# word_sizes('') == {}


# ---------------- Scratchpad ----------------



# ---------------- Data Structures (reason with data logically) ----------------
# Create something to bridge the gap between input and output.



# ---------------- Algorithm (steps from input to output) ----------------
# Write broad action steps to solve the problem. Create substeps for each broad action step.
# 1. Write a method `word_sizes` that takes one parameter.
# 2. Split the string on whitespace, moving each word to an array.
# 3. Iterate through the array, counting the length of each word, storing the count
# in another array.
# 4. Iterate through the count array, counting the number of times a particular number
# appears.
# 5. Create a new hash with the count as the key and the frequency of each count as the
# value.
# 6. Return the hash.


# ---------------- Code (translate algorithm to programming language) ----------------
def word_sizes(sentence)
  word_length = sentence.split(" ").map do |word|
    word.size.to_s
  end

  uniq_counts = word_length.uniq

  word_length.map do |x|
    if uniq_counts.include?(x)
  end
  # frequency = {}
  # word_count.uniq.each do |x|
  #   frequency[x] = 0
  # end

  # p word_count.count { |x| frequency.key?(x) }

  # frequency
end

p word_sizes('Four score and seven.') #== { 3 => 1, 4 => 1, 5 => 1, 6 => 1 }
p word_sizes('Hey diddle diddle, the cat and the fiddle!') #== { 3 => 5, 6 => 1, 7 => 2 }
p word_sizes("What's up doc?") #== { 6 => 1, 2 => 1, 4 => 1 }
p word_sizes('') #== {}