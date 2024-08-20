# Write a method that takes two strings as arguments, determines the longest of
# the two strings, and then returns the result of concatenating the shorter string,
# the longer string, and the shorter string once again. You may assume that the
# strings are of different lengths.

# P----------
# Write a method that takes two strings as arguments, determines the longest of the
# two strings, and returns the result of concatenating the shorter string, the
# longer string, and the shorter string.

# Implicit:
# - A string may be empty

# Explicit:
# - Assume strings are of different lengths

# Input: two strings
# Output: one new string that

# E----------
# short_long_short('abc', 'defgh') == "abcdefghabc"
# short_long_short('abcde', 'fgh') == "fghabcdefgh"
# short_long_short('', 'xyz') == "xyz"

# A----------
# 1- Define a method that takes two strings as arguments.
# 2- If first string is longer than second string, concatenate string2 + string1 +
# string2. Vice versa if second string is longer than second string.
# 3- Return new concatenated string.

# C----------
# Solution 1
# def short_long_short(string1, string2)
#   string1.size > string2.size ? string2 + string1 + string2 : string1 + string2 + string1
# end

# Solution 2
# def short_long_short(string1, string2)
#   if string1.size > string2.size
#     string2 + string1 + string2
#   else
#     string1 + string2 + string1
#   end
# end

# Solution 3
def short_long_short(string1, string2)
  arr = [string1, string2].sort_by { |x| x.length }
  arr.first + arr.last + arr.first
end

# Solution 4
# def short_long_short(string1, string2)
#   short, long = [string1, string2].sort do |a, b|
#     a.length <=> b.length
#   end

#   short + long + short
# end

p short_long_short('abc', 'defgh') == "abcdefghabc"
p short_long_short('abcde', 'fgh') == "fghabcdefgh"
p short_long_short('', 'xyz') == "xyz"