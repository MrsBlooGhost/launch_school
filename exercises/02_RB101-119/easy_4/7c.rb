# P-----------
# Write a method that takes a string of digits and returns the appropriate number
# as an integer.

# Input: a string of digits
# Output: an integer

# Explicit:
# - You may not use the methods `String#to_i` or `Integer()`.
# - Don't worry about leading `+` or `-` signs.
# - Don't worry about invalid characters. Assume all characters will be numeric.

# E-----------
# string_to_integer('4321') == 4321
# string_to_integer('570') == 570

# D-----------


# A-----------
# 1. Initialize a hash with keys as the string digit and values as the associated
# integer.
# 2. Define a method `string_to_integer` that takes one parameter.
# 3. Convert the input string to an array `letters` with each element as a letter.
# 4. Iterate through the array `letters`, using hash element reference to access
# the associated value.
# 5. To calculate the output integer, take each digit and add it to 10 times the
# previous value.
# 6. Return integer from Step 5.

# C-----------
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

p string_to_integer('4321') == 4321
p string_to_integer('570') == 570