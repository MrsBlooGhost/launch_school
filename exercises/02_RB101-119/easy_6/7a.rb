# P-----------
# Write a method that takes an array as an argument and returns two arrays, as a
# pair of nested arrays, that contain the first half and second half of the original
# array, respectively.

# Input: an array
# Output: a new nested array containing two arrays

# Explicit:
# - If the original array contains an odd number of elements, the middle element
# should be placed in the first half array.

# Implicit:
# - If the input array contains one element, it should be placed in the first
# half array.
# - If the input array contains no elements, return two empty nested arrays.

# E-----------
# halvsies([1, 2, 3, 4]) == [[1, 2], [3, 4]]
# halvsies([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]]
# halvsies([5]) == [[5], []]
# halvsies([]) == [[], []]

# D-----------

# A-----------
# 1. Define a method `halvsies` that takes one parameter.
# 2. Initialize `resulting_array` to an empty array.
# 3. Initialize `arr1` and `arr2` to an empty array.
# 4. Use a conditional to push elements from input array to `arr1` and `arr2`.
#   - If input array has 0 elements, skip this step.
#   - If input array has 1 element, push it to `arr1`.
#   - If input array has an even number of elements, push the first half to `arr1`
#   and second half to `arr2`.
#     - Determine input array's size / 2. Use this number - 1 as the indices for
#     accessing the first half of elements.
#   - If input array has an odd number of elements, push the first half to `arr1`
#   and second half to `arr2`.
#     Determine input array's size / 2. Use this number as the indices for accessing
#     the first half of the elements.
# 5. Push `arr1` and `arr2` to `resulting_array` in order to create a nested array.
# 6. Return nested array from Step 5.

# C-----------
def halvsies(array)
  resulting_array = []
  arr1 = []
  arr2 = []

  if array.size == 1
    array.each { |num| arr1.push(num) }
  elsif array.size % 2 == 0
    array.each do |num|
      arr1.push(num) if array.index(num) < array.size / 2
      arr2.push(num) if array.index(num) >= array.size / 2
    end
  elsif array.size % 2 != 0
    array.each do |num|
      arr1.push(num) if array.index(num) <= array.size / 2
      arr2.push(num) if array.index(num) > array.size / 2
    end
  end

  resulting_array.push(arr1).push(arr2)
end

p halvsies([1, 2, 3, 4]) == [[1, 2], [3, 4]]
p halvsies([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]]
p halvsies([5]) == [[5], []]
p halvsies([]) == [[], []]