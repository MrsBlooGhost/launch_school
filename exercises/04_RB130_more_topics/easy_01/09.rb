=begin
--- P
Input: an array and a block
Return: true if the block returns true for exactly one of the elements; false otherwise

Rules: 
- Stop processing elements of the Array as soon as the block returns `true` a second time.
- If the Array is empty, return `false`, regardless of how the block is defined.
- You may not use any standard ruby method that is named `all?`, `any?`, `none?`, or `one?`.
--- E
one?([1, 3, 5, 6]) { |value| value.even? }    # -> true
one?([1, 3, 5, 7]) { |value| value.odd? }     # -> false
one?([2, 4, 6, 8]) { |value| value.even? }    # -> false
one?([1, 3, 5, 7]) { |value| value % 5 == 0 } # -> true
one?([1, 3, 5, 7]) { |value| true }           # -> false
one?([1, 3, 5, 7]) { |value| false }          # -> false
one?([]) { |value| true }                     # -> false
--- D

--- A1
- Initialize `found_one` to false.
- Iterate through given array, accessing each element. 
  - Yield current element to the block.
  - If yielding returns true,
    - Re-assign `found_one` to the opposite boolean.
    - If `found_one` evaluates to false, return false.
- Return `found_one`.
=end

# --- C1
# Iterate through the array, yielding each element to the block.
# Use a local variable as a toggle to keep track of the block's return value. Set it to false, by default, and toggle it to true the first time the block returns a truthy value. If the block returns a truthy value again, explicitly return false.
# If we make it through all iterations, return the value of `result`.

def one?(array)
  found_one = false
  array.each do |el|
    if yield(el)
      found_one = !found_one
      return false unless found_one
    end
  end
  found_one
end

# --- C2
# We initialize a counter. 
# We iterate through the given array, yielding each element to the block. If the block returns true, we increment the counter. Then, we check if the counter is greater than 1; if so, we explicitly return false.
# If we make it through all the iterations, we check if the counter is equal to 1 and return true if so.

def one?(array)
  counter = 0
  array.each do |el|
    counter += 1 if yield(el)
    return false if counter > 1
  end
  counter == 1
end

p one?([1, 3, 5, 6]) { |value| value.even? }    # -> true
p one?([1, 3, 5, 7]) { |value| value.odd? }     # -> false
p one?([2, 4, 6, 8]) { |value| value.even? }    # -> false
p one?([1, 3, 5, 7]) { |value| value % 5 == 0 } # -> true
p one?([1, 3, 5, 7]) { |value| true }           # -> false
p one?([1, 3, 5, 7]) { |value| false }          # -> false
p one?([]) { |value| true }                     # -> false