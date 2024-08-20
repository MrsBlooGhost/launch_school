=begin
--- P
Input: an array and a block
Return: `true` if the block returns `true` for any of the elements; `false` otherwise

Rules:
- Stop processing elements of the Array as soon as the block returns `true`.
- If the Array is empty, return false, regardless of how the block is defined.
- You may not use any standard ruby method that is named `all?`, `any?`, `none?`, or `one?`.
--- E
any?([1, 3, 5, 6]) { |value| value.even? } == true
any?([1, 3, 5, 7]) { |value| value.even? } == false
any?([2, 4, 6, 8]) { |value| value.odd? } == false
any?([1, 3, 5, 7]) { |value| value % 5 == 0 } == true
any?([1, 3, 5, 7]) { |value| true } == true
any?([1, 3, 5, 7]) { |value| false } == false
any?([]) { |value| true } == false
--- D

--- A
- Iterate through given array, accessing each element.
  - Yield current element to the block.
    - If yielding returns true, explicitly return true.
- Return false.
=end

# We iterate through the collection, and return `true` the first time we encounter an item that produces a true result when it is yielded to the block. If no such item is encountered, we return `false`.

def any?(array)
  array.each { |el| return true if yield(el) }
  false
end

p any?([1, 3, 5, 6]) { |value| value.even? } == true
p any?([1, 3, 5, 7]) { |value| value.even? } == false
p any?([2, 4, 6, 8]) { |value| value.odd? } == false
p any?([1, 3, 5, 7]) { |value| value % 5 == 0 } == true
p any?([1, 3, 5, 7]) { |value| true } == true
p any?([1, 3, 5, 7]) { |value| false } == false
p any?([]) { |value| true } == false