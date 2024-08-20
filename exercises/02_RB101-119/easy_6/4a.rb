# P-----------
# Write a method that takes an array as an argument and reverses its elements in
# place.

# Input: an array
# Output: input array, mutated

# Explicit:
# - The return value is the same array object. The method mutates the array passed
# in.
# - You may not use `Array#reverse` or `Array#reverse!`.
# - The method reverses the ELEMENTS in the array. If the array contains only one
# element, a string, it should return that element. It should not reverse the string
# itself.

# E-----------
# list = [1,2,3,4]
# result = reverse!(list)
# result == [4, 3, 2, 1] # true
# list == [4, 3, 2, 1] # true
# list.object_id == result.object_id # true

# list = %w(a b e d c)
# reverse!(list) == ["c", "d", "e", "b", "a"] # true
# list == ["c", "d", "e", "b", "a"] # true

# list = ['abc']
# reverse!(list) == ["abc"] # true
# list == ["abc"] # true

# list = []
# reverse!(list) == [] # true
# list == [] # true

# D-----------

# A-----------
# 1. Define a method `reverse!` that takes one parameter.
# 2. Set one index to point to the beginning of the array and another index to
# point to the end of the array.
# 3.

# C-----------
def reverse!(array)
  left_index = 0
  right_index = -1

  while left_index < array.size / 2
    array[left_index], array[right_index] = array[right_index], array[left_index]
    left_index += 1
    right_index -= 1
  end

  array
end

p list = [1,2,3,4]
p result = reverse!(list)
# p result #== [4, 3, 2, 1] # true
# p list #== [4, 3, 2, 1] # true
# p list.object_id == result.object_id # true

p list = %w(a b e d c)
p reverse!(list) #== ["c", "d", "e", "b", "a"] # true
# p list == ["c", "d", "e", "b", "a"] # true

p list = ['abc']
p reverse!(list) == ["abc"] # true
p list == ["abc"] # true

p list = []
p reverse!(list) == [] # true
p list == [] # true