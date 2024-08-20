# Problem Description:
# Write a method that returns true if the string passed as an argument is a
# palindrome, false otherwise. A palindrome reads the same forward and backward.
# For this exercise, case matters as does punctuation and spaces.


# ---------------- Problem (establish rules, define boundaries) ----------------
# Re-write the problem statement.
# Write a method that takes one parameter and returns `true` if the string passed
# as an argument is a palindrome. It should return `false` otherwise. A
# palindrome is a word that reads the same forward as it does backward. For this
# exercise, case, punctuation, and spaces matter.

# Input: a string argument
# Output: a boolean value

# Rules
# Explicit:
# - The method returns `true` if the string passed as an argument is a palindrome,
# and `false` if it is not
# - A palindrome is a word that reads the same forward as it does backward.
# - Case, punctuation, and spaces matter.

# Implicit:


# ---------------- Examples (confirm/refute assumptions ----------------
# palindrome?('madam') == true
# palindrome?('Madam') == false          # (case matters)
# palindrome?("madam i'm adam") == false # (all characters matter)
# palindrome?('356653') == true


# ---------------- Scratchpad ----------------
# palindrome?('madam') == true
#  - length of string: 5, last index: 4, 0&4, 1&3, increment/decrement 1x
# palindrome?('Madam') == false          # (case matters)
#  - length of string: 5, last index: 4, 0&4, 1&3, increment/decrement 1x
# palindrome?("madam i'm adam") == false # (all characters matter)
#  - length of string: 14, last index: 13, 0&13, 1&12, 2&11, 3&10, 4&9, 5&8, 6&7,
# increment/decrement 6x
# palindrome?('356653') == true
#  - length of string: 6, last index: 5, 0&5, 1&4, 2&3, increment/decrement 2x

# ---------------- Data Structures (reason with data logically) ----------------
# Create something to bridge the gap between input and output.


# ---------------- Algorithm (steps from input to output) ----------------
# Write broad action steps to solve the problem. Create substeps for each broad action step.
# 1. Define a method `palindrome?` that takes one parameter `string`.
# 2. Check if the character at index `0` is equal to the character at the last
# index of the string.
# 3. If not, return `false`.
# 4. If it is, check if the character at index `1` is equal to the character
# at the second to last index of the string.
# 5. Repeat steps 2-4 for a total of (last index of string)/2 times.
#   - Initialize a local variable `count_up` to `0`.
#   - Initialize a local variable `count_down` to 1 less than the length of `string`.
#   - Check if character of string at index `count_up` is equal to character of
#   string at index `count_down`.
#   - Increment `count_up` by 1, decrement `count_down` by 1.
#   - Check again.
#   - Increment/decrement a total of (last index of string)/2 times.
# 3. The method should return `true` if the string passed as an argument is a
# palindrome, and `false` if it isn't.


# ---------------- Code (translate algorithm to programming language) ----------------
def palindrome?(string)
  count_up = 0
  count_down = string.length - 1
  result = nil
  loop do
    result = string[count_up] == string[count_down]
    count_up += 1
    count_down -= 1
    break if count_up > count_down / 2 || result == false
  end
  result
end

p palindrome?('madam') == true
p palindrome?('Madam') == false          # (case matters)
p palindrome?("madam i'm adam") == false # (all characters matter)
p palindrome?('356653') == true