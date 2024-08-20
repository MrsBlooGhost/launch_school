# Problem Description:


# ---------------- Problem (establish rules, define boundaries) ----------------
# Re-write the problem statement.
# Given a string that consists of lowercased words and non-alphabetic characters,
# write a method that returns that string with all of the non-alphabetic characters
# replaced by spaces.

# Input: a string
# Output: a string

# Rules
# Explicit:
# - If one or more non-alphabetic characters occur in a row, only one space should be
# in the resulting string. The result shouldn't have consecutive spaces.
# - Input string has all words lowercased.
# Implicit:


# ---------------- Examples (confirm/refute assumptions ----------------
# cleanup("---what's my +*& line?") == ' what s my line '


# ---------------- Scratchpad ----------------



# ---------------- Data Structures (reason with data logically) ----------------
# Create something to bridge the gap between input and output.


# ---------------- Algorithm (steps from input to output) ----------------
# Write broad action steps to solve the problem. Create substeps for each broad action step.
# 1. Create a method `cleanup` that takes one parameter.
# 2. Use regexp to replace all non-alphabetic characters with one space, and create
# a new string that contains this.
# 3. Return the string.


# ---------------- Code (translate algorithm to programming language) ----------------
def cleanup(sentence)

  p sentence.gsub(/[^a-z]/, " ").squeeze(" ")
end

cleanup("---what's my +*& line?") #== ' what s my line '