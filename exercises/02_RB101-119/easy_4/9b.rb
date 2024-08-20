# P---------------
# Write a method that takes a positive integer or zero, and converts it to a string
# representation.

# You may not use the standard conversion methods available in Ruby, such as
# `Integer#to_s`, `String()`, or `Kernel#format`.

# Input: a positive integer or zero
# Output: a string

# Explicit:
# - You may not use the standard conversion methods available in Ruby, such as
# `Integer#to_s`, `String()`, or `Kernel#format`

# E---------------
# integer_to_string(4321) == '4321'
# integer_to_string(0) == '0'
# integer_to_string(5000) == '5000'

# D---------------

# A---------------
# 1. Define a method `integer_to_string` that takes one parameter.
# 2. Initialize a hash containing integers as keys and the string representation
# as values.
# 3. Use a combination of modulus and division to isolate the digit at index 0, 1,
# 2, etc.
# 4. Use the isolated digit to access the associated value in the hash.
# 5. Concatenate the retrieved value in a string.
# 6. Return the string.

# C---------------
DIGITS = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9', '10']

def integer_to_string(number)
  result = ''
  loop do
    number, remainder = number.divmod(10)
    result.prepend(DIGITS[remainder])
    break if number == 0
  end
  result
end

p integer_to_string(4321) #== '4321'
# p integer_to_string(0) #== '0'
# p integer_to_string(5000) #== '5000'