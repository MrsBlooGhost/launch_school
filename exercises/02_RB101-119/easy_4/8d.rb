# P------
# Write a method that takes a string of digits and returns its integer
# representation. The string may have a leading + or - sign.

# explicit:
# - if the first character is a +, the method returns a positive number
# - if the first character is a -, the method returns a negative number
# - assume the string contains a valid number
# - you may not use the standard conversion methods such as `String#to_i` or
# `Integer()`
# - you may use the `string_to_integer` method from the previous exercise

# implicit:

# input: a string
# return: an integer

# E------
# string_to_signed_integer('4321') == 4321
# string_to_signed_integer('-570') == -570
# string_to_signed_integer('+100') == 100

# D------

# A------
# 1- Define a method that takes a string as an argument.
# 2- Use a conditional to return a negative integer if input string starts with a
# - sign.
#   - Evaluate the string starting at the character at index 1.
# 3- Use a conditional to return a positive integer if input string either starts
# with a + sign or doesn't start with a sign.
#   - If it starts with a + sign, evaluate the string starting at the character
#   at index 1.
# 4- Use the `string_to_integer` method from the previous exercise to return the
# integer.

# C-----
DIGITS = {
  '0' => 0, '1' => 1, '2' => 2, '3' => 3, '4' => 4,
  '5' => 5, '6' => 6, '7' => 7, '8' => 8, '9' => 9
}

def string_to_integer(string)
  digits = string.chars.map { |char| DIGITS[char] }

  value = 0
  digits.each { |digit| value = 10 * value + digit }
  value
end

def string_to_signed_integer(string)
  case string[0]
  when '-' then -string_to_integer(string[1..-1])
  when '+' then string_to_integer(string[1..-1])
  else          string_to_integer(string)
  end
end

p string_to_signed_integer('4321') == 4321
p string_to_signed_integer('-570') == -570
p string_to_signed_integer('+100') == 100