# Problem Description:
# Write a method that takes an Array of numbers, and returns an Array with the same
# number of elements, and each element has the running total from the original Array.
# A running total is the sum of all values in a list up to and including the current
# element. Thus, the running total when looking at index 2 of the array
# `[14, 11, 7, 15, 20]` is 32 (14 + 11 + 7), while the running total at index 3 is
# 47 (14 + 11 + 7 + 15).


# ---------------- Problem (establish rules, define boundaries) ----------------
# Re-write the problem statement.
# Given an array of numbers, write a method that returns an array with the same
# number of elements. Each element should have the running total from the original
# array. A running total is the sum of all values in a list up to and including
# the current element.

# Input: an array
# Output: an array

# Rules
# Explicit:
# - Each element of the returned array should have the running total from the
# original array.
# - A running total is the sum of all values in the list up to and including the
# current element.
#   - e.g. running total at index 2 of `[14, 11, 7, 15, 20]` is 32 (14 + 11 + 7)
#   - e.g. running total at index 3 of `[14, 11, 7, 15, 20]` is 47 (14 + 11 + 7 + 15)
# Implicit:
# - Are we returning the same array object or a new array object? Will assume it's
# a new array
# - If input array is empty, return an empty array.

# ---------------- Examples (confirm/refute assumptions ----------------
# running_total([2, 5, 13]) == [2, 7, 20]
# running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
# running_total([3]) == [3]
# running_total([]) == []


# ---------------- Scratchpad ----------------
# new array:
# value at index 0 = (value at index 0)
# value at index 1 = (value at index 0) + (value at index 1)
# value at index 2 = (value at index 0) + (value at index 1) + (value at index 2)
# etc...

# ---------------- Data Structures (reason with data logically) ----------------
# Create something to bridge the gap between input and output.



# ---------------- Algorithm (steps from input to output) ----------------
# Write broad action steps to solve the problem. Create substeps for each broad action step.
# 1. Define a method `running_total` that takes one parameter.
# 2. If input is an empty array, return an empty array.
# 3. Create new array with values...
#   - at index 0: input array value at index 0
#   - at index 1: input array value at index 0 + index 1
#   - at index 2: input array value at index 0 + index 1 + index 2
#   - and so on...
# 4. Return new array


# ---------------- Code (translate algorithm to programming language) ----------------
def running_total(array)
  new_array = []
  if array.size == 0
    new_array
  else
    count = 0
    new_array[count] = array[count]
    loop do
      break if array.size == new_array.size
      count += 1
      new_array[count] = array[0..count].reduce(:+)
    end
    new_array
  end
end
