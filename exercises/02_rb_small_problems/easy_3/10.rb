# Problem Description:
# Write a method that takes a string argument, and returns true if all of the
# alphabetic characters inside the string are uppercase, false otherwise.
# Characters that are not alphabetic should be ignored.


# ---------------- Problem (establish rules, define boundaries) ----------------
# Re-write the problem statement.
# Write a method that takes one parameter, and returns `true` if, in the string
# argument passed in, all the alphabetic characters in the string are uppercase,
# and `false` otherwise. Non-alphabetic characters should be ignored.

# Input: a string
# Output: a boolean value

# Rules
# Explicit:
# - the method returns `true` if all the alphabetic characters in the string are
# uppercase, `false` otherwise
# - ignore non-alphabetic characters

# Implicit:


# ---------------- Examples (confirm/refute assumptions ----------------
# uppercase?('t') == false
# uppercase?('T') == true
# uppercase?('Four Score') == false
# uppercase?('FOUR SCORE') == true
# uppercase?('4SCORE!') == true
# uppercase?('') == true


# ---------------- Scratchpad ----------------



# ---------------- Data Structures (reason with data logically) ----------------
# Create something to bridge the gap between input and output.



# ---------------- Algorithm (steps from input to output) ----------------
# Write broad action steps to solve the problem. Create substeps for each broad action step.
# 1. Define a method `uppercase?` that takes one parameter.
# 2. Check if all the alphabetic characters in the string argument are uppercase.
# If so, return `true`. If not, return `false`.


# ---------------- Code (translate algorithm to programming language) ----------------
def uppercase?(string)
  uppercased_string = string.upcase
  string.include?(uppercased_string)
end