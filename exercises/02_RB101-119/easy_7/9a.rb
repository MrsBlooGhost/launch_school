=begin
P-----
Write a method that takes two array arguments in which each array contains a list
of numbers and return a new array that contains the product of every pair of
numbers that can be formed between the elements of the two arrays.

Rules:
- The results should be sorted by increasing value.
- Assume that neither argument is an empty array.

E-----
multiply_all_pairs([2, 4], [4, 3, 1, 2]) == [2, 4, 4, 6, 8, 8, 12, 16]

A-----
- Define a method `multiply_all_pairs` with two parameters.
- Initialize local variable `results` to an empty array.
- Iterate through array1.
  - On each iteration, iterate through array2.
  - Multiply the current element of array1 by the current element of array2.
- Repeat steps for array2.
- Sort `results` by the integer.
- Return `results`.

C-----
=end

def multiply_all_pairs(arr1, arr2)
  results = []
  arr1.each do |arr1_num|
    arr2.each do |arr2_num|
      results << arr1_num * arr2_num
    end
  end
  results.sort
end

p multiply_all_pairs([2, 4], [4, 3, 1, 2]) == [2, 4, 4, 6, 8, 8, 12, 16]