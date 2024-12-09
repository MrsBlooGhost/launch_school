# P-----------
# Write a method that takes as an argument a string that consists of all lowercased
# words and an assortment of non-alphabetic characters, then returns that string
# with all non-alphabetic characters replaced by spaces.

# Input: a string
# Output: a new string

# Explicit:
# - If one or more non-alphabetic characters occur in a row, only have one space in
# the result. The result should never have consecutive spaces.

# E-----------
# cleanup("---what's my +*& line?") == ' what s my line '

# D-----------

# A-----------
# 1. Define a method `cleanup` that takes one parameter.
# 2. Convert input string to array, split on whitespace.
# 3. Replace all non-alphabetic characters with a whitespace.
# 4. Compress any consecutive whitespaces to just one whitespace.
# 5. Return new string.

# C-----------
def cleanup(sentence)
  replaced_nonalphabeticals = sentence.split.map do |word|
    word.gsub(/[^a-zA-Z0-9_]/, " ").squeeze
  end
  replaced_nonalphabeticals.delete(" ")
  replaced_nonalphabeticals.join(" ")
end

p cleanup("---what's my +*& line?") == ' what s my line '