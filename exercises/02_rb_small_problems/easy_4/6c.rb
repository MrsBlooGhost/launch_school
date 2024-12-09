# P--------------
# Write a method that takes an array of numbers and returns an array with the same
# number of elements, but each element is the running total from the original
# array.

# Input: an array of integers
# Output: a new array of integers

# Explicit:
# - A running total is the sum of all values in a list up to  and including the
# current element.

# E--------------
# running_total([2, 5, 13]) == [2, 7, 20]
# running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
# - running total at index 2 is 32 (14 + 11 + 7)
# - running total at index 3 is 47 (14 + 11 + 7 + 15)
# running_total([3]) == [3]
# running_total([]) == []

# D--------------

# A--------------
# 1. Define a method `running_total` that takes one parameter.
# 2. Initialize a variable `total` to `0`.
# 3. Iterate through the input array, adding the value of the first element of the
# input array to `total`. Set `total` to the first element of a new array.
# Continue for next element, etc.
# 4. Return new array from Step 3.

# C--------------
# solution using `map`
# def running_total(array)
#   sum = 0
#   totals = array.map do |element|
#     sum += element
#   end
# end

# soution using `Enumerable#each_with_object`
# def running_total(array)
#   sum = 0
#   array.each_with_object([]) do |element, new_array|
#     sum += element
#     new_array << sum
#   end
# end

# solution using `Enumerable#inject`
# def running_total(array)
#   sum = 0
#   array.inject([]) { |memo, element| memo << sum += element }
# end

p running_total([2, 5, 13]) == [2, 7, 20]
p running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
p running_total([3]) == [3]
p running_total([]) == []