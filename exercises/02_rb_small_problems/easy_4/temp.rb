# P-----
# Write a method that takes a positive integer or zero, and converts it to a string
# representation.

# explicit:
# - You may not use `Integer#to_s`, `String()`, or `Kernel#format`.

# implicit:

# input: an integer
# return: a string

# E-----
# integer_to_string(4321) == '4321'
# integer_to_string(0) == '0'
# integer_to_string(5000) == '5000'

# D-----

# A-----
# 1- Create a constant hash with the string representation of integers as the keys
# and the corresponding integer as the value.
# 2- Define a method that takes an integer as an argument.
# 3- Assign a variable `num` to the result of the input integer `divmod(10)` and
# a variable `remainder` to the result of the modulus.
# 4- On each iteration, use `remainder` to access the corresponding value in the hash,
# and append this to a string `string`.
# 5- Return the string from Step 4.

# C-----
DIGITS = {
  0 => '0', 1 => '1', 2 => '2', 3 => '3', 4 => '4', 5 => '5',
  6 => '6', 7 => '7', 8 => '8', 9 => '9'
}

def integer_to_string(number)
  string = ''
  loop do
    number, remainder = number.divmod(10)
    string.prepend(DIGITS[remainder])
    break if number == 0
  end
  string
end

def signed_integer_to_string(integer)
  case integer <=> 0
  when +1 then "+#{integer_to_string(integer)}"
  when -1 then "-#{integer_to_string(integer.abs)}"
  else         "#{integer_to_string(integer)}"
  end
end

p signed_integer_to_string(4321) == '+4321'
p signed_integer_to_string(-123) == '-123'
p signed_integer_to_string(0) == '0'