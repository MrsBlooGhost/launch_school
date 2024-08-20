=begin
P-----
Write a method that rotates an array by moving the first element to the end of
the array.

Rules:
- Don't modify the original array.
- Don't use the `Array#rotate` or `Array#rotate!` methods.

Input: an array
Return: a new array

E-----
rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
rotate_array(['a']) == ['a']

x = [1, 2, 3, 4]
rotate_array(x) == [2, 3, 4, 1]   # => true
x == [1, 2, 3, 4]                 # => true

A-----
- Initialize a new array `result`.
- Prepend element at index 0 of input array to `result`.
- Iterate over input array backwards.
  - Prepend each element to `result`.
- Delete element at index 0 of `result`.
- Return `result`.

C-----
=end

# Initial Solution
# def rotate_array(array)
#   result = []
#   result << array[0]
#   array.reverse_each { |num| result.prepend(num) }
#   result.delete_at(0)
#   result
# end

# LS Solution
# def rotate_array(array)
#   array[1..-1] + [array[0]]
# end

p rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
p rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
p rotate_array(['a']) == ['a']

p x = [1, 2, 3, 4]
p rotate_array(x) == [2, 3, 4, 1]   # => true
p x == [1, 2, 3, 4]                 # => true