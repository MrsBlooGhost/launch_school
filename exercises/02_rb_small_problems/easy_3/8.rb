# Problem Description:
# Write another method that returns true if the string passed as an argument is a
# palindrome, false otherwise. This time, however, your method should be
# case-insensitive, and it should ignore all non-alphanumeric characters. If you
# wish, you may simplify things by calling the palindrome? method you wrote in
# the previous exercise.

# ---------------- Problem (establish rules, define boundaries) ----------------
# Re-write the problem statement.
# Write a method that takes one parameter and returns `true` if the string passed
# as an argument is a palindrome, and `false` otherwise. The method should be
# case-insensitive and ignore all non-alphanumeric characters.

# Input: a string
# Output: a boolean value

# Rules
# Explicit:
# - the method returns `true` is the string passed as an argument is a palindrome,
# and `false` otherwise
# - case does not matter
# - only alphanumerics matter
# Implicit:
# - punctuation doesn't matter
# - whitespaces don't matter

# ---------------- Examples (confirm/refute assumptions ----------------
# real_palindrome?('madam') == true
# real_palindrome?('Madam') == true           # (case does not matter)
# real_palindrome?("Madam, I'm Adam") == true # (only alphanumerics matter)
# real_palindrome?('356653') == true
# real_palindrome?('356a653') == true
# real_palindrome?('123ab321') == false


# ---------------- Scratchpad ----------------



# ---------------- Data Structures (reason with data logically) ----------------
# Create something to bridge the gap between input and output.



# ---------------- Algorithm (steps from input to output) ----------------
# Write broad action steps to solve the problem. Create substeps for each broad action step.
# 1. Define a method `real_palindrome?` that takes one parameter.
# 2. Remove whitespaces from argument.
# 3. Make all characters lowercase.
# 4. Disregard punctuation.
# 5. Check if string argument matches string argument reversed. If so, return `true`
# and if not, return `false`.


# ---------------- Code (translate algorithm to programming language) ----------------
def real_palindrome?(string)
  no_whitespace = string.delete(" ")
  lowercase = no_whitespace.downcase
  no_punctuation = lowercase.delete(",").delete("'")
  no_punctuation == no_punctuation.reverse
end