=begin
P-----
Write a method that takes one argument, an array of integers, and returns the
average of all numbers in the array.

Rules:
- The array won't be empty.
- The numbers are positive integers.
- Don't use `Array#sum`.
- Try solving the problem using iteration.

Input: an array of positive integers
Return: an integer

E-----
puts average([1, 6]) == 3
  - integer division: (1 + 6) / 2 -> 3
puts average([1, 5, 87, 45, 8, 8]) == 25
puts average([9, 47, 23, 95, 16, 52]) == 40

A-----
- Define a method `average` with one parameter `array`.
- Initialize local variable `total_sum` to 0.
- Iterate through the array:
  - Re-assign `running_total` to `running_total` plus current element.
- Divde `total_sum` by `array.size`. Return this value.

C-----
=end

def average(array)
  # total_sum = 0
  # array.each do |num|
  #   total_sum += num
  # end
  # total_sum / array.size
  sum = array.reduce { |sum, number| sum + number}
  sum / array.count
end

puts average([1, 6]) == 3
puts average([1, 5, 87, 45, 8, 8]) == 25
puts average([9, 47, 23, 95, 16, 52]) == 40