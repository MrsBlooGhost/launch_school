# ---------------- Problem
# Re-write the problem statement.
# Given an integer (positive, negative, or zero), write a method that takes one
# argument and returns `true` if the absolute value of the integer is odd. Assume
# that the argument is a valid integer value.

# Input: an integer (positive, negative, or zero)
# Output: `true` if absolute value of integer is odd, `false` otherwise

# Rules (implicit and explicit):
# Explicit:
# - the integer may be positive, negative, or zero
# - the method takes one argument, which is assumed to be a valid integer
# - method returns `true` is absolute value of integer is odd
# - you may not use the `#odd?` or `#even?` methods
# Implicit:
# - method returns `false` if absolute value of integer is not odd

# ---------------- Examples
# puts is_odd?(2)    # => false
# puts is_odd?(5)    # => true
# puts is_odd?(-17)  # => true
# puts is_odd?(-8)   # => false
# puts is_odd?(0)    # => false
# puts is_odd?(7)    # => true


# ---------------- Scatchpad
# GREAT IDEA!!


# ---------------- Data Structures
# You may want to create something to bridge the gap between the input and the output.


# ---------------- Algorithm
# Write broad action steps to solve the problem, then create substeps for each broad action step.

# 1. Define a method `is_odd?` that takes one argument, `integer`.
# 2. Use a conditional statement to determine if `integer` is even or odd.
# 3. If `integer` is even or zero, return nil. If `integer` is odd, return `true`.

# ---------------- Code

def is_odd?(integer)
  if integer % 2 == 0 || integer == 0
    false
  else
    true
  end
end

puts is_odd?(2)    # => false
puts is_odd?(5)    # => true
puts is_odd?(-17)  # => true
puts is_odd?(-8)   # => false
puts is_odd?(0)    # => false
puts is_odd?(7)    # => true