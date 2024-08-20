# ---------------- Problem
# Re-write the problem statement.
# Given a positive integer, write a method that takes it as an argument and
# returns that integer with its digits reversed.

# Input: a positive integer
# Output: the integer with digits reversed

# Rules (implicit and explicit):
# Explicit:
# - return the integer with digits reversed
# - if there are leading zeros in the input integer, ignore them and just return
# just an integer with the non-zero integers in reversed order
# Implict:
# - we are returning a new integer since numerics are immutable

# ---------------- Examples
# reversed_number(12345) == 54321
# reversed_number(12213) == 31221
# reversed_number(456) == 654
# reversed_number(12000) == 21 # No leading zeros in return value!
# reversed_number(12003) == 30021
# reversed_number(1) == 1


# ---------------- Scatchpad
# GREAT IDEA!!


# ---------------- Data Structures
# You may want to create something to bridge the gap between the input and the output.


# ---------------- Algorithm
# Write broad action steps to solve the problem, then create substeps for each broad action step.

# 1. Define a method `reversed_number` that takes one argument, `integer`.
# 2. Convert `integer` into a string.
# 3. Reverse the string.
# 4. Convert string from step 3 to integer, and return it.
# ---------------- Code

def reversed_number(integer)
  reversed_digits = integer.to_s.reverse
  reversed_digits.to_i
end


p reversed_number(12345) == 54321
p reversed_number(12213) == 31221
p reversed_number(456) == 654
p reversed_number(12000) == 21 # No leading zeros in return value!
p reversed_number(12003) == 30021
p reversed_number(1) == 1