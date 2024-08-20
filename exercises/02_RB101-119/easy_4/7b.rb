# P-----------
# Write a method that converts a string of numeric characters (including an
# optional plus or minus sign) to an integer. You may not use any of the standard
# conversion methods available in Ruby to convert a string to a number, such as
# `String#to_i` or `Integer()`.

# Input: a string of numeric characters
# Output: an integer

# Explicit:
# - You may not use `String#to_i` or `Integer()` to convert a string to a number

# E-----------
# string_to_integer('4321') == 4321
# string_to_integer('570') == 570

# D-----------

# A-----------
# 1. Define a method `string_to_integer` that takes one parameter.
# 2. Initialize a hash that contains numeric characters as the key and the
# corresponding number as the value.
# 3. Iterate through the input string, using the numeric character at each index
# of the string as a key to access the corresponding value in the hash.
#   - Use some sort of multiplication to obtain the desired integer:
#     4321 = 4 * 1000 + 3 * 100 + 2 * 10 + 1 * 1
#     570 = 5 * 100 + 7 * 10 + 0 * 1
# 4. Return an integer.

# C-----------
NUMBERS = {'1'=> 1, '2'=> 2, '3'=> 3, '4'=> 4, '5'=> 5, '6'=> 6, '7'=> 7, '8'=> 8,
'9'=> 9, '0'=> 0}

def string_to_integer(string)
  digits = string.chars.map { |char| NUMBERS[char] }

  value = 0
  digits.each { |number| value = 10 * value + number }
  value
end

p string_to_integer('4321') #== 4321
p string_to_integer('570') #== 570