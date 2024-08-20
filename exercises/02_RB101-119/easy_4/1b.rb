# P------
# Write a method that takes two strings as arguments and determines the longest of
# the two strings, then returns the result of concatenating the shorter string,
# the longer string, and the shorter string together. Assume that the strings are
# of different lengths.

# Input: two strings
# Output: a new concatenated string

# Explicit:
# - The method returns a new string that's the result of concatenating the shorter
# string, the longer string, and the shorter string together.
# - Assume input strings are of different lengths.

# Implicit:
# - The string argument can be an empty string.

# E------
# short_long_short('abc', 'defgh') == "abcdefghabc"
# short_long_short('abcde', 'fgh') == "fghabcdefgh"
# short_long_short('', 'xyz') == "xyz"

# D------


# A------
# 1. Write a method `short_long_short` that takes two arguments.
# 2. Determine the longer of the two string arguments.
# 3. Concatenate the shorter string, the longer string, and the shorter string.
# 4. Return the resulting string from Step 3.

# C------
# Solution using `if/else` logic
# def short_long_short(string1, string2)
#   if string1.length > string2.length
#     string2 + string1 + string2
#   else
#     string1 + string2 + string1
#   end
# end

# Solution using a ternary operator
# def short_long_short(string1, string2)
#   string1.length > string2.length ? string2 + string1 + string2 : string1 + string2 + string1
# end

# Solution using `sort_by`
# def short_long_short(string1, string2)
#   arr = [string1, string2].sort_by { |word| word.length }
#   arr.first + arr.last + arr.first
# end

p short_long_short('abc', 'defgh') == "abcdefghabc"
p short_long_short('abcde', 'fgh') == "fghabcdefgh"
p short_long_short('', 'xyz') == "xyz"