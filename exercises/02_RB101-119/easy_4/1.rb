# Problem Description:
# Write a method that takes two strings as arguments, determines the longest of
# the two strings, and then returns the result of concatenating the shorter
# string, the longer string, and the shorter string once again. You may assume
# that the strings are of different lengths.


# ---------------- Problem (establish rules, define boundaries) ----------------
# Re-write the problem statement.
# Given two strings, write a method that determines the longest of the two strings
# and returns the result of concatenating the shorter string, the longer string,
# and the shorter string together. Assume that the strings are of different lengths.

# Input: two strings
# Output: a new concatenated string

# Rules
# Explicit:
# - method takes two string arguments
# - strings are of different lengths

# Implicit:
# - an input string can be an empty string


# ---------------- Examples (confirm/refute assumptions ----------------
# short_long_short('abc', 'defgh') == "abcdefghabc"
# short_long_short('abcde', 'fgh') == "fghabcdefgh"
# short_long_short('', 'xyz') == "xyz"


# ---------------- Scratchpad ----------------



# ---------------- Data Structures (reason with data logically) ----------------
# Create something to bridge the gap between input and output.



# ---------------- Algorithm (steps from input to output) ----------------
# Write broad action steps to solve the problem. Create substeps for each broad action step.
# 1. Define a method `short_long_short` that takes two parameters.
# 2. Determine which of the two input string arguments are shorter.
# 3. Concatenate the shorter string, the longer string, and the shorter string
# together.
# 4. Return string from step 3.


# ---------------- Code (translate algorithm to programming language) ----------------

def short_long_short(string1, string2)
  if string1.length < string2.length
    string1 + string2 + string1
  else
    string2 + string1 + string2
  end
end

p short_long_short('abc', 'defgh') == "abcdefghabc"
p short_long_short('abcde', 'fgh') == "fghabcdefgh"
p short_long_short('', 'xyz') == "xyz"