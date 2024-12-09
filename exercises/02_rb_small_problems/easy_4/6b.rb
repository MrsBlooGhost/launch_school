# P-----------
# Write a method that takes an array of numbers and returns an array with the same
# number of elements. The returned array should contain elements that are the
# running total from the original array.

# A running total is the sum of all values in a list up to and including the
# current element.
# E.g. [14, 11, 7, 15, 20]
# - Running total at index 2 is (14 + 11 + 7), or 32
# - Running total at index 3 is (14 + 11 + 7 + 15), or 47

# Input: an array of numbers
# Output: a new array of numbers, with each element as the running total from the
# original array

# Explicit:
# - The method returns a new array containing elements that are the running total
# from the original array
# - A running total is the sum of all values in a list up to and including the
# current element

# Implicit:
# - If input is an empty array, the method returns an empty array

# E-----------
# running_total([2, 5, 13]) == [2, 7, 20]
# running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
# running_total([3]) == [3]
# running_total([]) == []

# D-----------

# A-----------
# 1. Define a method `running_total` that takes one parameter.
# 2. Initialize a new variable `new_arr`.
# 3. Initialize a new variable `current_total`.
# 4. If input array is empty, return an empty array.
# 5. If it's not empty, iterate through the input array and add the current
# element to `current_total`.
# 6. Push `current_total` to `new_arr`.
# 7. Return `new_arr`.

# C-----------
# def running_total(arr)
#   sum = 0
#   arr.map { |value| sum += value }
# end


p running_total([2, 5, 13]) == [2, 7, 20]
p running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
p running_total([3]) == [3]
p running_total([]) == []