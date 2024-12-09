# Problem Description:
# Write a method that returns true if its integer argument is palindromic, false
# otherwise. A palindromic number reads the same forwards and backwards.

# ---------------- Problem (establish rules, define boundaries) ----------------
# Re-write the problem statement.
# Write a method that takes one parameter, and returns `true` if the integer
# argument passed in is palindromic, and `false` otherwise. A palindromic
# number reads the same forwards and backwards.

# Input: integer
# Output: a boolean value

# Rules
# Explicit:
# - the method returns `true` if the integer is palindromic, and `false` otherwise
# - a palindromic number reads the same forwards and backwards

# Implicit:


# ---------------- Examples (confirm/refute assumptions ----------------
# palindromic_number?(34543) == true
# palindromic_number?(123210) == false
# palindromic_number?(22) == true
# palindromic_number?(5) == true


# ---------------- Scratchpad ----------------



# ---------------- Data Structures (reason with data logically) ----------------
# Create something to bridge the gap between input and output.



# ---------------- Algorithm (steps from input to output) ----------------
# Write broad action steps to solve the problem. Create substeps for each broad action step.
# 1. Define a method `palindromic_number?` that takes one parameter.
# 2. Check if integer argument reads the same forwards as it does backwards. If so,
# return `true` and if not, return `false`.


# ---------------- Code (translate algorithm to programming language) ----------------
def palindromic_number?(num)
  num.to_s == num.to_s.reverse
end
