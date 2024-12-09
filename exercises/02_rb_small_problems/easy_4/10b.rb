# P--------------
# Write a method that takes an integer and converts it to a string representation.
# You may not use any of the standard conversion methods available in Ruby,
# such as `Integer#to_s`, `String()`, or `Kernel#format`. You may use the
# `integer_to_string` method from the previous exercise.

# Input: an integer (positive or negative) or zero
# Output: a string

# Explicit:
# - You may not use any of the standard conversion methods available in Ruby,
# such as `Integer#to_s`, `String()`, or `Kernel#format`
# - You may use the  `integer_to_string` method from the previous exercise

# Implicit:
# - If integer is positive, return a string that starts with +
# - If integer is negative, return a string that starts with -
# - If integer is zero, return a string representation of 0

# E--------------
# signed_integer_to_string(4321) == '+4321'
# signed_integer_to_string(-123) == '-123'
# signed_integer_to_string(0) == '0'

# D--------------

# A--------------
# 1. Define a method `signed_integer_to_string` that takes one parameter.
# 2. If input integer is zero, invoke `integer_to_string` and pass input in.
# 3. If input integer is positive, invoke `integer_to_string` and pass input in.
# Then, prepend a `+` to the return value of the method. Return this value.
# 4. If input integer is negative, call `abs` on the input then pass it into
# `integer_to_string`. Then, prepend a `-` to the return value of the method.
# Return this value.

# C--------------
DIGITS = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9']

def integer_to_string(number)
  result = ''
  loop do
    number, remainder = number.divmod(10)
    result.prepend(DIGITS[remainder])
    break if number == 0
  end
  result
end

def signed_integer_to_string(number)
  if number == 0
    integer_to_string(number)
  elsif number == number.abs
    integer_to_string(number).prepend('+')
  elsif number != number.abs
    integer_to_string(number.abs).prepend('-')
  end
end

p signed_integer_to_string(4321) == '+4321'
p signed_integer_to_string(-123) == '-123'
p signed_integer_to_string(0) == '0'