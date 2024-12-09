# P-----------
# Write a method that takes an array and returns a new array with the elements of
# the original list in reverse order.

# Input: an array
# Output: a new array

# Explicit:
# - Don't modify the original list.
# - You may not use the `Array#reverse` or `Array#reverse!` methods.
# - You may not use the method from the previous exercise.

# E-----------
# reverse([1,2,3,4]) == [4,3,2,1]          # => true
# reverse(%w(a b e d c)) == %w(c d e b a)  # => true
# reverse(['abc']) == ['abc']              # => true
# reverse([]) == []                        # => true

# list = [1, 3, 2]                      # => [1, 3, 2]
# new_list = reverse(list)              # => [2, 3, 1]
# list.object_id != new_list.object_id  # => true
# list == [1, 3, 2]                     # => true
# new_list == [2, 3, 1]                 # => true

# D-----------

# A-----------
# 1. Define a method `reverse` that takes one parameter.
# 2. Initialize a variable `new_array` to an empty array.
# 3. If input array is empty, return `new_array`.
# 4. If input array has 1 element, push it to `new_array` and return `new_array`.
# 5. If input array has 2 or more elements, iterate through the input array in
# reverse order and push each element to `new_array`. Return `new_array`.

# C-----------
def reverse(array)
  new_array = []
  if array.empty?
    return new_array
  elsif array.size == 1
    return new_array.push(array[0])
  else
    right_idx = -1
    left_idx = 0
    array.map do |element|
      new_array[left_idx] = array[right_idx]
      left_idx += 1
      right_idx -= 1
      new_array
    end
    new_array
  end
end

p reverse([1,2,3,4]) == [4,3,2,1]          # => true
p reverse(%w(a b e d c)) == %w(c d e b a)  # => true
p reverse(['abc']) == ['abc']              # => true
p reverse([]) == []                        # => true

p list = [1, 3, 2]                      # => [1, 3, 2]
p new_list = reverse(list)              # => [2, 3, 1]
p list.object_id != new_list.object_id  # => true
p list == [1, 3, 2]                     # => true
p new_list == [2, 3, 1]                 # => true