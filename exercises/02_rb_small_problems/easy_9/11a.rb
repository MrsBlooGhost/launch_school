=begin
P-----
Write a method that returns an array containing every other element of an array
passed in as an argument.

Rules:
- The values in the returned listed should be those in the 1st, 3rd, 5th, etc.
elements of the argument array.

Input: an array
Return: a new array

E-----
oddities([2, 3, 4, 5, 6]) == [2, 4, 6]
oddities([1, 2, 3, 4, 5, 6]) == [1, 3, 5]
oddities(['abc', 'def']) == ['abc']
oddities([123]) == [123]
oddities([]) == []
oddities([1, 2, 3, 4, 1]) == [1, 3, 1]

A-----
- Define a method `oddities` with one parameter `array`.
- Iterate through the array, performing selection:
  - If the index of the current element is even, return the element.

C-----
=end
def oddities(array)
  array.select { |num| num if array.index(num).even? }
end

p oddities([2, 3, 4, 5, 6]) == [2, 4, 6]
p oddities([1, 2, 3, 4, 5, 6]) == [1, 3, 5]
p oddities(['abc', 'def']) == ['abc']
p oddities([123]) == [123]
p oddities([]) == []
p oddities([1, 2, 3, 4, 1]) == [1, 3, 1]