# Problem Description:
# Write a program that will ask a user for an input of a word or multiple words
# and give back the number of characters. Spaces should not be counted as a
# character.

# ---------------- Problem (establish rules, define boundaries) ----------------
# Re-write the problem statement.

# Input: string
# Output: a string describing the number of characters in input string

# Rules
# Explicit:
# - user can enter one or more words
# - spaces do not count as a character

# Implicit:
# - puncuation marks count as characters


# ---------------- Examples (confirm/refute assumptions ----------------
# Please write word or multiple words: walk
# There are 4 characters in "walk".

# Please write word or multiple words: walk, don't run
# There are 13 characters in "walk, don't run".


# ---------------- Scratchpad ----------------



# ---------------- Data Structures (reason with data logically) ----------------
# Create something to bridge the gap between input and output.
# - Array?


# ---------------- Algorithm (steps from input to output) ----------------
# Write broad action steps to solve the problem. Create substeps for each broad action step.
# 1. Prompt the user for word/s and save input in variable `string`.
# 2. Write a method that
#    - Removes whitespace from input string and save in variable
#      `no_whitespace`.
#    - Counts number of characters in `no_whitespace` and save in variable
#      `number_of_char`.
# 3. Print statement describing the number of characters in the input string.


# ---------------- Code (translate algorithm to programming language) ----------------
puts "Please write word or multiple words:"
string = gets.chomp

def count(string)
  no_whitespace = string.delete(" ")
  number_of_char = no_whitespace.length
end

puts "There are #{count(string).to_s} characters in \"#{string}\"."