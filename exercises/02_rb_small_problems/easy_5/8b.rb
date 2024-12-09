# P----------
# Write a method that takes an array of integers between 0 and 19 and returns an
# array of those integers sorted based on the English words for each number:
# zero, one, two, three, four, five, six, seven, eight, nine, ten, eleven, twelve,
# thirteen, fourteen, fifteen, sixteen, seventeen, eighteen, nineteen

# E----------
# alphabetic_number_sort((0..19).to_a) == [
#   8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17,
#   6, 16, 10, 13, 3, 12, 2, 0
# ]

# D----------

# A----------
# 1. Initialize a constant array with English numeric words ordered as they should
# be.
# 2. Define a method `alphabetic_number_sort` that takes one parameter (numbers) and
# calls `.to_a` on it.
# 3. Sort the numbers based on the order in which they appear in the constant array.

# C----------
NUMBER_WORDS = %w(zero one two three four
               five six seven eight nine
               ten eleven twelve thirteen fourteen
               fifteen sixteen seventeen eighteen nineteen)

def alphabetic_number_sort(numbers)
  numbers.sort_by { |number| NUMBER_WORDS[number] }
end

p alphabetic_number_sort((0..19).to_a) == [
  8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17,
  6, 16, 10, 13, 3, 12, 2, 0
]