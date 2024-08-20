# P------------
# Write a method that takes two strings as arguments and determines the longer of
# the two strings, then returns the result of concatenating the shorter string,
# the longer string, and the shorter string again. Assume that the strings are of
# different lengths

# Input: two strings
# Output: a new string

# Explicit:
# - Assume that the strings are ofdifferent lengths

# E------------
# short_long_short('abc', 'defgh') == "abcdefghabc"
# short_long_short('abcde', 'fgh') == "fghabcdefgh"
# short_long_short('', 'xyz') == "xyz"

# D------------

# A------------
# 1. Define a method `short_long_short` that takes two parameters.
# 2. Determine which of the two strings is longer.
# 3. Concatenate the shorter string, the longer string, and the shorter string.
# 4. Return the string from Step 3.

# C------------
# using `if/else` logic
# def short_long_short(string1, string2)
#   if string1.length < string2.length
#     string1 + string2 + string1
#   else
#     string2 + string1 + string2
#   end
# end

# using a ternary operator
# def short_long_short(string1, string2)
#   string1.length < string2.length ? string1 + string2 + string1 : string2 + string1 + string2
# end

# using `sort_by`
# def short_long_short(string1, string2)
#   arr = [string1, string2].sort_by { |string| string.length }
#   arr.first + arr.last + arr.first
# end

p short_long_short('abc', 'defgh') == "abcdefghabc"
p short_long_short('abcde', 'fgh') == "fghabcdefgh"
p short_long_short('', 'xyz') == "xyz"