# P----------------
# Write a method that takes an array of strings and returns an array of the same
# string values, except with the vowels removed.

# Input: an array of strings
# Output: an array of the same string values with vowels removed

# Explicit:
# - Vowels are a, e, i, o, u.

# E----------------
# remove_vowels(%w(abcdefghijklmnopqrstuvwxyz)) == %w(bcdfghjklmnpqrstvwxyz)
# remove_vowels(%w(green YELLOW black white)) == %w(grn YLLW blck wht)
# remove_vowels(%w(ABC AEIOU XYZ)) == ['BC', '', 'XYZ']

# D----------------

# A----------------
# 1. Initialize a constant `VOWELS` to an array(?) with elements a, e, i, o, u.
# 2. Define a method `remove_vowels` that takes one parameter.
# 3. Iterate through the array. If the current element matches any of the elements
# in `VOWELS`, delete it.
# 4. Return the array.

# C----------------
VOWELS = %(aeiouAEIOU)

def remove_vowels(string)
  string.map { |word| word.delete(VOWELS) }
end

p remove_vowels(%w(abcdefghijklmnopqrstuvwxyz)) == %w(bcdfghjklmnpqrstvwxyz)
p remove_vowels(%w(green YELLOW black white)) == %w(grn YLLW blck wht)
p remove_vowels(%w(ABC AEIOU XYZ)) == ['BC', '', 'XYZ']