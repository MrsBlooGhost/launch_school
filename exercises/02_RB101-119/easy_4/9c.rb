# P------------
# Write a method that takes a positive integer or zero and converts it to a string
# representation.

# Input: a positive integer or zero
# Output: a string

# Explicit:
# - You may not use the `Integer#to_s`, `String()`, or `Kernel#format` methods.

# E------------
# integer_to_string(4321) == '4321'
# integer_to_string(0) == '0'
# integer_to_string(5000) == '5000'

# D------------

# A------------
# 1. Initialize an array `STR_DIGITS` to string representations of 0-9.
# 2. Define a method `integer_to_string` that takes one parameter.
# 3. Do input integer modulo 10 and save the remainder in `remainder` and dividend in
# `integer`.
# 4. Use array element reference and `remainder` to access the associated string digit.
# 5. Add the string digit from Step 4 to an empty string.
# 6. Repeat Steps 3-5 until `integer == 0`.
# 7. Return the string integer.

# C------------
STR_DIGITS = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9']

def integer_to_string(integer)
  string_integer = ''
  loop do
    integer, remainder = integer.divmod(10)
    string_integer.prepend(STR_DIGITS[remainder])
    break if integer == 0
  end
  string_integer
end

p integer_to_string(4321) == '4321'
p integer_to_string(0) == '0'
p integer_to_string(5000) == '5000'