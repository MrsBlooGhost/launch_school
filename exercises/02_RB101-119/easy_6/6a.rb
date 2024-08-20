# P----------------
# Write a method that takes two arrays as arguments and returns an array that
# contains all of the values from the argument arrays.

# Input: two arrays
# Output: one new array

# Explicit:
# - There should be no duplication of values in the returned array, even if there
# are duplicates in the original arrays.

# E----------------
# merge([1, 3, 5], [3, 6, 9]) == [1, 3, 5, 6, 9]

# D----------------

# A----------------
# 1. Define a method `merge` that takes two parameters.
# 2. Initialize a new variable `result_array` to an empty array.
# 3. Push values from first array to `result_array`.
# 4. Push values from second array to `result_array`.
# 5. Call a method that returns only the unique values from `result_array`.
# 6. Return `result_array`.

# C----------------
def merge(array1, array2)
  result_array = []
  result_array.push(array1).push(array2).flatten!.uniq!
end

p merge([1, 3, 5], [3, 6, 9]) == [1, 3, 5, 6, 9]