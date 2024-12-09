# ---------------- Problem
# Re-write the problem statement.
# Given a positive integer and a boolean, write a method that takes two
# arguments and calcuates the bonus for a given salary. If the boolean is `true`,
# the bonus should be half of the given salary. If the boolean is `false`, the
# bonus should be `0`.

# Input: a positive integer, a boolean
# Output: integer

# Rules (implicit and explicit):
# Explicit:
# - the method takes two arguments, a positive integer and a boolean value
# - if the boolean is `true`, return half of the given integer
# - if the boolean is `false`, return `0`


# ---------------- Examples
# puts calculate_bonus(2800, true) == 1400 # true
# puts calculate_bonus(1000, false) == 0 # true
# puts calculate_bonus(50000, true) == 25000 # true


# ---------------- Scatchpad
# GREAT IDEA!!


# ---------------- Data Structures
# You may want to create something to bridge the gap between the input and the output.


# ---------------- Algorithm
# Write broad action steps to solve the problem, then create substeps for each broad action step.

# 1. Define a method `calculate_bonus` that takes two arguments.
# 2. Determine what bonus to return.
#   - if boolean value is `true`, return half of the given salary as bonus
#   - if boolean value is `false`, return `0` as bonus

# ---------------- Code

def calculate_bonus(salary, bonus)
  bonus ? (salary/2) : 0
end

puts calculate_bonus(2800, true) == 1400 # true
puts calculate_bonus(1000, false) == 0 # true
puts calculate_bonus(50000, true) == 25000 # true