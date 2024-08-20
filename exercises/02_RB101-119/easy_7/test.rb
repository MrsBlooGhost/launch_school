=begin
P-----
Write a method that combines two arrays passed in as arguments and returns a new
array that contains all elements from both array arguments with elements in alternation.

Rules:
- Assume that both input arrays aren't empty and that they have the same number
of elements.

E-----
interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']

A-----
- Define a method `interleave` with two parameters.
- Initialize local variable `result` to an empty array.
- Initialize local variable `index` to `0`.
- Loop:
  - For each input array, use array element reference to access element at
    `index` and append it to `result`.
  - Increment `index` by 1.
  - `break` from loop when `index > 2`.
- Return `result`.

C-----
=end

def interleave(arr1, arr2)
  arr1.zip(arr2).flatten
end

p interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']