# P-----
# Write a method that takes an Array of numbers, and returns an Array with the
# same number of elements, and each element has the running total from the
# original Array.

# A running total is the sum of all values in a list up to and including the
# current element. Thus, the running total when looking at index 2 of the array
# `[14, 11, 7, 15, 20]` is 32 (14 + 11 + 7), while the running total at index 3
# is 47 (14 + 11 + 7 + 15).

# Write a method that takes an array of numbers as an argument, and returns an
# array with the same number of elements, with each element as the running total
# from the original array.

# implicit:
# - if input is an empty array, return an empty array

# explicit:
# - A running total is the sum of all the values in a list up to and including
# the current element.

# input: array of numbers
# return: new array of numbers

# E-----
# running_total([2, 5, 13]) == [2, 7, 20]
# running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
# running_total([3]) == [3]
# running_total([]) == []

# D-----

# A-----
# 1- Initialize a local variable `current_sum`.
# 2- Use the `map` method to return a new array of transformed elements:
#   - Iterate through the input array, and re-assign `current_sum` to the first
# element.
#   - On each after the first iteration, add the current element to `current_sum`.

# C-----
# def running_total(array)
#   current_total = 0
#   array.map do |num|
#     current_total += num
#   end
# end

# def running_total(array)
#   current_total = 0
#   array.each_with_object([]) do |num, ary|
#     current_total += num
#     ary << current_total
#   end
# end

def running_total(array)
  current_sum = 0
  array.inject([]) do |total_array, num|
     total_array << current_sum += num
  end
end

p running_total([2, 5, 13]) == [2, 7, 20]
p running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
p running_total([3]) == [3]
p running_total([]) == []