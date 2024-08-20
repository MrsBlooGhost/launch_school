=begin
--- P
Input: an array and a block
Return: true if the block returns false for all of the elements; false otherwise

Rules:
- Stop processing elements of the Array as soon as the block returns `true`.
- If the Array is empty, return `true`, regardless of how the block is defined.
- You may not use any of the following methods from the `Array` and `Enumerable` classes: `all?`, `any?`, `none?`, `one?`. You may, however, use either of the methods created in the previous two exercises.
--- E
none?([1, 3, 5, 6]) { |value| value.even? } == false
none?([1, 3, 5, 7]) { |value| value.even? } == true
none?([2, 4, 6, 8]) { |value| value.odd? } == true
none?([1, 3, 5, 7]) { |value| value % 5 == 0 } == false
none?([1, 3, 5, 7]) { |value| true } == false
none?([1, 3, 5, 7]) { |value| false } == true
none?([]) { |value| true } == true
--- D

--- A
- Iterate through given array, accessing each element.
  - Yield current element to the block.
    - If yielding returns true, explicitly return false.
- Return true. 
=end

# The key to this solution is that `#none?` is the opposite of `#any?`. `#any?` returns true if the collection contains a match, false if it doesn't. `#none?` returns true if the collection doesn't contain any matches, and false if it does. 
# We'll modify the `#any?` method we wrote earlier. Instead of returning `true` from the `#each` loop, we return `false`. Instead of returning `false` after the loop, we return `true`.

def none?(array)
  array.each { |el| return false if yield(el) }
  true
end

p none?([1, 3, 5, 6]) { |value| value.even? } == false
p none?([1, 3, 5, 7]) { |value| value.even? } == true
p none?([2, 4, 6, 8]) { |value| value.odd? } == true
p none?([1, 3, 5, 7]) { |value| value % 5 == 0 } == false
p none?([1, 3, 5, 7]) { |value| true } == false
p none?([1, 3, 5, 7]) { |value| false } == true
p none?([]) { |value| true } == true