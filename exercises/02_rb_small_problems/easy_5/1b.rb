# P------------
# Write a method that determines and returns the ASCII string value of a string
# passed in as an argument.

# Explicit:
# - The ASCII string value is the sum of the ASCII values of every character
# in the string.
# - You may use `String#ord` to determine the ASCII value of a character.

# E------------
# ascii_value('Four score') == 984
# ascii_value('Launch School') == 1251
# ascii_value('a') == 97
# ascii_value('') == 0

# D------------

# A------------
# 1. Define a method `ascii_value` that takes one parameter.
# 2. Initialize a variable `ascii_total` to `0`.
# 3. Convert the input string to an array of letters `letters`.
# 4. Iterate through `letters`, calling `String#ord` on each letter and saving that
# value to `ascii_total`.
# 5. Return `ascii_total`.

# C------------
def ascii_value(string)
  ascii_total = 0
  string.chars.each do |letter|
    ascii_total += letter.ord
  end
  ascii_total
end

p ascii_value('Four score') == 984
p ascii_value('Launch School') == 1251
p ascii_value('a') == 97
p ascii_value('') == 0