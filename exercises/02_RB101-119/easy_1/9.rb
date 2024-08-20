# ---------------- Problem
# Re-write the problem statement.
# Given a non-empty string, write a method that takes it as an argument and
# and returns the middle character/s of the string argument. If the length of the
# string argument is odd, return one character. If it's even, return two characters.

# Input: a string that is not empty
# Output: a string

# Rules (implicit and explicit):
# Explicit:
# - the given string is not empty
# - the method returns the middle character/s of the string argument
# - if the length of the string argument is odd, return one character
# - if the length of the string argument is even, return two characters

# Implicit:


# ---------------- Examples
# center_of('I love ruby') == 'e' # length: 11 --> return one char @ index 5
# center_of('Launch School') == ' ' # length: 13 -> return one char @ index 6
# center_of('Launch') == 'un'# length: 6 --> return two chars @ index 2 & 3
# center_of('Launchschool') == 'hs' # length: 12 --> return two chars @ index 5 & 6
# center_of('x') == 'x' # length: 1 --> return one char @ index 0


# ---------------- Scatchpad
# GREAT IDEA!!


# ---------------- Data Structures
# You may want to create something to bridge the gap between the input and the output.


# ---------------- Algorithm
# Write broad action steps to solve the problem, then create substeps for each broad action step.

# 1. Define a method `center_of` that takes one argument, `string`.
# 2. Get length of string.
# 3. Return characters based on string length.
#   - If length of string is even, return characters at ((string length)/2) - 1 and
#   (string length)/2.
#   - If length of string is odd and greater than 1, return character at index
#   string length/2)
#   - If length of string is 1, return character at index 0

# ---------------- Code

def center_of(string)
  if string.length == 1
    string[0]
  elsif string.length.even?
    "#{string[(string.length)/2 - 1]}#{string[(string.length)/2]}"
  else
    "#{string[(string.length)/2]}"
  end
end

p center_of('I love ruby') == 'e' # length: 11 --> return one char @ index 5
p center_of('Launch School') == ' ' # length: 13 -> return one char @ index 6
p center_of('Launch') == 'un'# length: 6 --> return two chars @ index 2 & 3
p center_of('Launchschool') == 'hs' # length: 12 --> return two chars @ index 5 & 6
p center_of('x') == 'x' # length: 1 --> return one char @ index 0
