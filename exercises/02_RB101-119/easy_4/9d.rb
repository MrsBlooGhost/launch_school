# P-----
# Write a method that takes a positive integer or zero and converts it to a string
# representation.

# explicit:
# - you may not use the standard conversion methods such as `Integer#to_s`,
# `String()`, or `Kernel#format`

# implicit:

# input: an integer
# return: a string

# E-----
# integer_to_string(4321) == '4321'
# integer_to_string(0) == '0'
# integer_to_string(5000) == '5000'
# D-----

# A-----
# 1- Create a constant hash with integers 0-9 as keys and their string representation
# as values.
# 2- Use `divmod` to obtain each digit of the string representation.
# 3- Add the string representation to an array.
# 4- Join all the characters of the array into a string.
# 5- Return the string.
# C-----
CHARS = {
  1 => '1', 2 => '2', 3 => '3', 4 => '4', 5 => '5',
  6 => '6', 7 => '7', 8 => '8', 9 => '9', 0 => '0'
}

def integer_to_string(number)
  result = ''
  loop do
  number, remainder = number.divmod(10)
  result.prepend(CHARS[remainder])
  break if number == 0
  end
  result
end
p integer_to_string(4321) #== '4321'
p integer_to_string(0) #== '0'
p integer_to_string(5000) #== '5000'