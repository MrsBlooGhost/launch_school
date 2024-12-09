# ---------------- Problem
# Re-write the problem statement.
# Write a method that takes one argument, a number. If the number is positive,
# the method should return the negative of that number. If the number is 0 or
# negative, the method should return the original given number.

# Input: an integer (positive, 0, or negative)
# Output: an integer

# Rules (implicit and explicit):
# Explicit:
# - If given number is positive (1 and greater), the method returns the negative
# of that number.
# - If given number is 0 or negative, the method returns that given number.

# ---------------- Examples
# negative(5) == -5
# negative(-3) == -3
# negative(0) == 0      # There's no such thing as -0 in ruby

# ---------------- Scatchpad
# GREAT IDEA!!


# ---------------- Data Structures
# You may want to create something to bridge the gap between the input and the output.


# ---------------- Algorithm
# Write broad action steps to solve the problem, then create substeps for each broad action step.
# 1. Define a method `negative` that takes one argument `number`.
# 2. If `number` is greater than 0, return the negative of `number`.
# 3. If `number` is 0 or less, return `number`.

# ---------------- Code

def negative(number)
  if number > 0
    -number
  elsif number <= 0
    number
  end
end

p negative(5) == -5
p negative(-3) == -3
p negative(0) == 0