=begin
--- P
Input: an array and a block
Return: true if the block returns true for all of the elements; `false` otherwise

Rules:
- Stop processing elements of the Array as soon as the block returns false.
- If the Array is empty, return true, regardless of how the block is defined.
- You may not use any standard ruby method that is named `all?`, `any?`, `none?`, or `one?`.
--- E
all?([1, 3, 5, 6]) { |value| value.odd? } == false
all?([1, 3, 5, 7]) { |value| value.odd? } == true
all?([2, 4, 6, 8]) { |value| value.even? } == true
all?([1, 3, 5, 7]) { |value| value % 5 == 0 } == false
all?([1, 3, 5, 7]) { |value| true } == true
all?([1, 3, 5, 7]) { |value| false } == false
all?([]) { |value| false } == true
--- D

--- A
- Iterate through given array, accessing each element.
  - Yield current element to the block. If yielding returns false, explicitly return false.
- Return true.
=end

# We iterate through the collection, and return `false` if we encounter an item that produces a false result when it is yielded to the block. If no such item is encountered, we return `true`.

def all?(array)
  array.each { |el| return false unless yield(el) }
  true
end

p all?([1, 3, 5, 6]) { |value| value.odd? } == false
p all?([1, 3, 5, 7]) { |value| value.odd? } == true
p all?([2, 4, 6, 8]) { |value| value.even? } == true
p all?([1, 3, 5, 7]) { |value| value % 5 == 0 } == false
p all?([1, 3, 5, 7]) { |value| true } == true
p all?([1, 3, 5, 7]) { |value| false } == false
p all?([]) { |value| false } == true