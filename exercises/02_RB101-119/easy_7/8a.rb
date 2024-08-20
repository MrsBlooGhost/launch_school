=begin
P-----
Write a method that takes two array arguments in which each array contains a
list of numbers and returns a new array that contains the product of each pair
of numbers from the arguments that have the same index.

Rules:
- Assume that the arguments contain the same number of elements.

Input: two arrays
Return: one new array

E-----
multiply_list([3, 5, 7], [9, 10, 11]) == [27, 50, 77]

A-----
- Define a method `multiply_list` with two parameters.
- Initialize local variable `result` to an empty array.
- Iterate through `array1` and multiply each element of `array1` by each element
of `array2` with the same index.
  - Push the return value to `result`.
- Return `result`.

C-----
=end

def multiply_list(arr1, arr2)
  # result = []
  # arr1.each_with_index do |element, index|
  #   result << element * arr2[index]
  # end
  # result
  arr1.zip(arr2).map { |subarray| subarray.inject(:*) }
end

p multiply_list([3, 5, 7], [9, 10, 11]) == [27, 50, 77]