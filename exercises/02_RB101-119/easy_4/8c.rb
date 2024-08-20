# P------------
# Extend the method from the previous exercise so that it works with signed numbers.
# Write a method that takes a string of digits and returns the appropriate number
# as an integer.

# Input: a string of digits
# Output: an integer

# Explicit:
# - The string may have a leading `+` or `-` sign.
# If the first character is a `+`, the method returns a positive number.
# - If it is a `-`, the method returns a negative number.
# - If no sign is given, the method returns a positive number.
# - You may not use `String#to_i` or `Integer()`.
# - Use the `string_to_integer` method from the previous exercise.

# E------------
# string_to_signed_integer('4321') == 4321
# string_to_signed_integer('-570') == -570
# string_to_signed_integer('+100') == 100

# D------------

# A------------
# 1. Define a method `string_to_signed_integer` that takes one parameter.
# 2. If input string has no leading sign, invoke `string_to_integer`, passing in
# input string.
# 3. If input string has a leading `+`, invoke `string_to_integer`, passing in
# input string with `+` disregarded.
# 4. If input string has a leading `-`, invoke `string_to_integer`, passing in
# input string with `-` disregarded. Return the negative value from `string_to_integer`.

# C------------
VALUES = {'0'=> 0, '1'=> 1, '2'=> 2, '3'=> 3, '4'=> 4, '5'=> 5, '6'=> 6, '7'=> 7,
'8'=> 8, '9'=> 9}

def string_to_integer(string)
  number = 0
  string.chars.each do |string_digit|
    int = VALUES[string_digit]
    number = 10 * number + int
  end
  number
end

def string_to_signed_integer(string)
  case string[0]
  when '+' then string_to_integer(string[1..-1])
  when '-' then -string_to_integer(string[1..-1])
  else          string_to_integer(string)
  end
end

p string_to_signed_integer('4321') == 4321
p string_to_signed_integer('-570') == -570
p string_to_signed_integer('+100') == 100