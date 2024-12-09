# P-----------
# Write a method that takes a string argument and returns a new string that
# contains the value of the original string with all consecutive duplicate characters
# collapsed into a single character.

# Input: a string
# Output: a new string

# Explicit:
# - You may not use `String#squeeze` or `String#squeeze!`.

# E-----------
# crunch('ddaaiillyy ddoouubbllee') == 'daily double'
# crunch('4444abcabccba') == '4abcabcba'
# crunch('ggggggggggggggg') == 'g'
# crunch('a') == 'a'
# crunch('') == ''

# D-----------

# A-----------
# 1. Define a method `crunch` that takes one parameter.
# 2. Convert the input string into an array with letter as an element.
# 3. Iterate through the array, pushing the current element to a new array if
# the last element is not equal to the current element.
# 4. Convert the new array to a string and return the string.

# C-----------
def crunch(string)
  no_repeats = []
  string.chars.each do |letter|
    no_repeats << letter if no_repeats[-1] != letter
  end
  no_repeats.join
end

p crunch('ddaaiillyy ddoouubbllee') == 'daily double'
p crunch('4444abcabccba') == '4abcabcba'
p crunch('ggggggggggggggg') == 'g'
p crunch('a') == 'a'
p crunch('') == ''