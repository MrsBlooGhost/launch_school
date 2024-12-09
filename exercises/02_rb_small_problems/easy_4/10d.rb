# P-----
# Write a method that takes an integer and converts it to a string representation.
# Extend the method from the previous exercise by adding the ability to represent
# negative numbers as well.

# explicit:
# - you may not use the standard conversion methods such a `Integer#to_s`, `String()`,
# `Kernel#format`
# - you may use `integer_to_string`

# implicit:

# input: an integer
# return: a string

# E-----
# signed_integer_to_string(4321) == '+4321'
# signed_integer_to_string(-123) == '-123'
# signed_integer_to_string(0) == '0'

# D-----

# A-----
# 1- Define a method that takes one argument.
# 2- If input integer begins with a - sign, call the `integer_to_string` method,
# passing in the input integer, and using string interpolation to return the
# return value of the method call with a - sign in front.
# 3- If input integer begins with a + sign, call the `integer_to_string` method,
# passing in the input integer, and using string interpolation to return the
# return value of the method call with a + sign in front.
# 4- Otherwise, call the `integer_to_string` method, passing in the input integer.

# C-----
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
  case number <=> 0
  when -1 then "-#{integer_to_string(-number)}"
  when +1 then "+#{integer_to_string(number)}"
  else         integer_to_string(number)
  end
end

p signed_integer_to_string(4321) == '+4321'
p signed_integer_to_string(-123) == '-123'
p signed_integer_to_string(0) == '0'