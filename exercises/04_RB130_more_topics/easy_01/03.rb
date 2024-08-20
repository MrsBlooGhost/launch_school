=begin
--- P
Input: a sorted array of integers
Return: an array of all the missing integers, in order, between the first and last elements of given array
--- E
--- D
Input: Array
Return: Array
Intermediate: Iteration through given array.
--- A1
- Iterate through given array, checking if there are any missing numbers between the current number and the next number.
  - If so, append missing number/s to new array.
- Return the new array.
=end
# --- C1
def missing(numbers)
  result = []
  numbers.each_cons(2) do |first, second|
    (first+1...second).each { |missing| result << missing }
  end
  result
end

p missing([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]
p missing([1, 2, 3, 4]) == []
p missing([1, 5]) == [2, 3, 4]
p missing([6]) == []

# ----- C2
# We need to find the missing integers between each pair of numbers in the original array. 
# Use `Enumerable#each_cons` to iterate through consecutive, overlapping sequences. (In contrast, use `Enumerable#each_slice` to iterate through consecutive, non-overlapping sequences.) `Enumerable#each_cons(n)` takes `n` consecutive elements from the input collection, and iterates through each sequence `n` consecutive items.
# The block generates the list of numbers between each pair of numbers, and appends them to the `result` array.

def missing(array)
  result = []
  array.each_cons(2) do |first, second|
    result.concat( ( (first + 1)..(second - 1) ).to_a )
  end
  result
end

# --- C3 
# We first create an array of all numbers between the minimum and maximum numbers in the original array, then subtract the original "incomplete" array from the full "complete" array, returning an array of elements that were missing in the original array.

def missing(nums)
  full_array = ( (nums.min)..(nums.max) ).to_a
  full_array - nums
end

# Since the original array is already sorted, we gain a small performance advantage by skipping the `Array#min` and `Array#max` calls and simply using `#first` and `#last` to avoid extra computation.

def missing(nums)
  full_array = ( (nums.first)..(nums.last) ).to_a
  full_array - nums
end

# ----- C4
def missing(arr)
  ( (arr.first)..(arr.last) ).each_with_object([]) { |num, result| result << num unless arr.include?(num) }
end