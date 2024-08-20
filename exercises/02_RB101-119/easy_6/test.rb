=begin
P-----
Write a method `include?` that takes an array and a search value as arguments.
It should return `true` if the search value is in the array, and `false` otherwise.

rules:
- You may not use the `Array#include?` method.

E-----
include?([1,2,3,4,5], 3) == true
include?([1,2,3,4,5], 6) == false
include?([], 3) == false
include?([nil], nil) == true
include?([], nil) == false

D-----

A-----
- Define a method that takes two parameters: an array and an integer representing
a search value.
- Find the index of the search value.
- Call the double negation operator on the return value of Step 2.

C-----
=end

def include?(array, search_value)
  !!array.index(search_value)
end

p include?([1,2,3,4,5], 3) == true
p include?([1,2,3,4,5], 6) == false
p include?([], 3) == false
p include?([nil], nil) == true
p include?([], nil) == false