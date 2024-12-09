=begin
P-----
Write a method that combines two arrays passed in as arguments and returns a new
array that contians all elements from both arguments with alnernating elements.

rules:
- Assume that both input arrays are not empty.
- Assume that both input arrays have the same number of elements.

input: two arrays
return: one array

E-----
interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']

A-----
- Define a method that takes two arrays as arguments.
- Initialize local variable `interleaved_elements` to an empty array.
- Initialize local variable `index` to `0`.
- Start a loop that breaks when `index` is equal to 1 less than the size of `array1`:
  - Append element at `index` of `array1` to `interleaved_elements`, then append
  the element at `index` of `array2`.
  - Increment `index` by 1.
- Return `interleaved_elements`.

C-----
=end
def interleave(array1, array2)
  array1.zip(array2).flatten
end

p interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']