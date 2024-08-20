=begin
--- P
Input: an array and a block
Return: an integer representing the count of the number of times the block returns true
  - The block returns a boolean value depending on the value of the array element passed to it

Rules:
- You may not use `Array#count` or `Enumerable#count`.
--- E
count([1,2,3,4,5]) { |value| value.odd? } == 3
count([1,2,3,4,5]) { |value| value % 3 == 1 } == 2
count([1,2,3,4,5]) { |value| true } == 5
count([1,2,3,4,5]) { |value| false } == 0
count([]) { |value| value.even? } == 0
count(%w(Four score and seven)) { |value| value.size == 5 } == 2
--- D

--- A
- Initialize a counter to 0.
- Iterate through given array, accessing each element.
  - Yield current element to the block. Increment counter by 1 if yielding returns true.
- Return counter.
=end
# --- C
def count(array)
  counter = 0
  array.each { |el| counter += 1 if yield(el) }
  counter
end

# --- Further Exploration
def count(array)
  array.reduce(0) { |counter, el| yield(el) ? counter + 1 : counter }
end

p count([1,2,3,4,5]) { |value| value.odd? } == 3
p count([1,2,3,4,5]) { |value| value % 3 == 1 } == 2
p count([1,2,3,4,5]) { |value| true } == 5
p count([1,2,3,4,5]) { |value| false } == 0
p count([]) { |value| value.even? } == 0
p count(%w(Four score and seven)) { |value| value.size == 5 } == 2