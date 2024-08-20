# Problem Description:
# Write a method that takes a String of digits, and returns the appropriate number
# as an integer. You may not use any of the methods mentioned above.

# For now, do not worry about leading `+` or `-` signs, nor should you worry about
# invalid characters; assume all characters will be numeric.

# You may not use any of the standard conversion methods available in Ruby to
# convert a string to a number, such as `String#to_i`, `Integer()`, etc. Your
# method should do this the old-fashioned way and calculate the result by
# analyzing the characters in the string.


# ---------------- Problem (establish rules, define boundaries) ----------------
# Re-write the problem statement.
# Given a string of digits, write a method that returns the appropriate number
# as an integer. You may not use `String#to_i` or the `Integer()` constructor.
# Don't worry about leading `+` or `-` signs or invalid characters. Assume all
# characters will be numeric.

# Input: a string of digits
# Output: an integer

# Rules
# Explicit:
# - you may not use `String#to_i` or `Integer()` constructor
# - assume all characters in input string are numeric
# - don't account for leading `+`, `=`, or invalid characters

# Implicit:
# - should i assume that no floating point numbers are input?

# ---------------- Examples (confirm/refute assumptions ----------------
# string_to_integer('4321') == 4321
# string_to_integer('570') == 570


# ---------------- Scratchpad ----------------



# ---------------- Data Structures (reason with data logically) ----------------
# Create something to bridge the gap between input and output.
# hash


# ---------------- Algorithm (steps from input to output) ----------------
# Write broad action steps to solve the problem. Create substeps for each broad action step.
# 1. Define a method `string_to_integer` that takes one parameter.
# 2. Create a constant `reference` to a hash with keys as `0`, `1`, `2`, and so on,
# and values as 0, 1, 2, and so on.
# 3. Create a new empty string `number`.
# 3. Iterate through the input string and match each character with its associated
# value in our `reference` hash. Assign the associated value to the `number` string.
# 5. Return `number`


# ---------------- Code (translate algorithm to programming language) ----------------
REFERENCE = { '0' => 0, '1' => 1, '2' => 2, '3' => 3, '4' => 4, '5' => 5, '6' => 6,
'7' => 7, '8' => 8, '9' => 9, '10' => 10 }

def string_to_integer(string)
  array = []
  string.chars.each do |x|
    array << REFERENCE[x]
  end

  value = 0
  array.each { |digit| p value = 10 * value + digit }
  value

end

p string_to_integer('4321') == 4321
p string_to_integer('570') == 570