# ---------------- Problem
# Re-write the problem statement.
# Given a positive integer, write a method that takes one argument and returns a
# string of alternating 1s and 0s. The string should start with 1 and the length
# of the string should equal the given integer.

# Input: a positive integer
# Output: a string

# Rules (implicit and explicit):
# Explicit:
# - input integer is positive
# - output string contains alternating 1s and 0s
# - output string begins with 1
# - length of output string is equal to input integer
# Implicit:


# ---------------- Examples
# puts stringy(6) == '101010'    # true
# puts stringy(9) == '101010101' # true
# puts stringy(4) == '1010'      # true
# puts stringy(7) == '1010101'   # true


# ---------------- Scatchpad
# GREAT IDEA!!

# integer: 1 --> number: 1

# integer: 3 --> number: 1 plus 01s: 1
# integer: 5 --> number: 1 plus 01s: 2
# integer: 7 --> number: 1 plus 01s: 3
# integer: 9 --> number: 1 plus 01s: 4

# integer: 2 --> 10s: 1
# integer: 4 --> 10s: 2
# integer: 6 --> 10s: 3
# integer: 8 --> 10s: 4


# ---------------- Data Structures
# You may want to create something to bridge the gap between the input and the output.


# ---------------- Algorithm
# Write broad action steps to solve the problem, then create substeps for each broad action step.

# 1. Define a method `stringy` that takes one argument, `number`.
# 2. Write a conditional statement.
#   - If `number` is equal to `1`, return `"1"`.
#   - If `number` is odd, return the result of concatenating `"1"` with the result
#   multiplying `"01"` with `number`/2.
#   - If `number` is even, return the resulting multiplying `"10"` with `number`/2.

# ---------------- Code

def stringy(number)
  if number == 1
    "1"
  elsif number % 2 != 0
    "1" + ("01" * (number/2))
  else
    "10" * (number/2)
  end
end

 puts stringy(6) == '101010'    # true
 puts stringy(9) == '101010101' # true
 puts stringy(4) == '1010'      # true
 puts stringy(7) == '1010101'   # true