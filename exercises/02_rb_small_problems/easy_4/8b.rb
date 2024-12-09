# P----------
# WRite a method that takes a string of digits and returns the appropriate number
# as an a integer. The string may have a leading + or - sign. If the first character
# of the string is a +, your method should return a positive number. If no sign is
# given, return a positive number. If the first character is a -, your method
# should return a negative number.

# You may not use any of the standard conversion methods in Ruby, such as
# `String#to_i` or `Integer()`. You may use the `string_to_integer` method from the
# previous exercise.

# Input: a string of digits
# Output: an integer

# Explicit:
# -  If the first character of the string is a +, your method should return a
# positive number
# - If the first character is a -, your method  should return a negative number
# - If no sign is  given, return a positive number
# - You may not use any of the standard conversion methods in Ruby, such as
# `String#to_i` or `Integer()`
# - You may use the `string_to_integer` method from the previous exercise

# E----------
# string_to_signed_integer('4321') == 4321
# string_to_signed_integer('-570') == -570
# string_to_signed_integer('+100') == 100

# D----------

# A----------
# 1. Define a method `string_to_signed_integer` that takes one parameter.
# 2. Use a conditional to determine whether the input string is positive or
# negative.
#   - If no sign is given, it is positive. Call the `string_to_integer` method
#   and return the return value of this method.
#   - If it starts with a +, it is positive. Delete the + and pass string in to
#   `string_to_integer` method. Return the return value of the method.
#   - If it starts with -, it is negative. Delete the - and pass string in to
#   `string_to_integer` method. Return the negative return value of the method.

# C----------
NUMBERS = {'1'=> 1, '2'=> 2, '3'=> 3, '4'=> 4, '5'=> 5, '6'=> 6, '7'=> 7, '8'=> 8,
'9'=> 9, '0'=> 0}

def string_to_integer(string)
  digits = string.chars.map { |char| NUMBERS[char] }

  value = 0
  digits.each { |number| value = 10 * value + number }
  value
end

def string_to_signed_integer(string)
if string[0] == '-'
  no_sign = string.delete('-')
  -string_to_integer(no_sign)
elsif string[0] == '+'
  no_sign = string.delete('+')
  string_to_integer(no_sign)
else
    string_to_integer(string)
end
end

p string_to_signed_integer('4321') == 4321
p string_to_signed_integer('-570') == -570
p string_to_signed_integer('+100') == 100