# P------------
# Write a method that calculates and returns the index of the first Fibonacci number
# that has the number of digits specified as an argument.

# Input: an integer
# Output: an integer

# Explicit:
# - The first Fibonacci number has an index of 1.
# - Assume that the argument is >= 2.
# - The Fibonacci series is a series of number such that the first 2 numbers are 1
# by definition, and each subsequent number is the sum of the previous two numbers.

# E------------
# find_fibonacci_index_by_length(2) == 7          # 1 1 2 3 5 8 13
# find_fibonacci_index_by_length(3) == 12         # 1 1 2 3 5 8 13 21 34 55 89 144
# find_fibonacci_index_by_length(10) == 45
# find_fibonacci_index_by_length(100) == 476
# find_fibonacci_index_by_length(1000) == 4782
# find_fibonacci_index_by_length(10000) == 47847

# D------------

# A------------
# 1. Define a method `find_fibonacci_index_by_length` that takes one parameter.
# 2. Initialize an array `numbers` to `[1, 1]`.
# 3. Initialize a variable `index` to `2`.
# 4. Iniitalize a variable `next_number` to the value of `numbers[-2] + numbers[-1]`.
# 5. Push `next_number` to array `numbers`.
# 6. Check if `next_number.to_s.size` is equal to input integer. If so, return
# `next_number.to_s.size`. If not, continue to loop.

# C------------
def find_fibonacci_index_by_length(digits)
  numbers = [1, 1]
  index = 2
  loop do
    next_number = numbers[-2] + numbers[-1]
    numbers << next_number
    index += 1
    break if next_number.to_s.size == digits
  end
  index
end

p find_fibonacci_index_by_length(2) == 7          # 1 1 2 3 5 8 13
p find_fibonacci_index_by_length(3) == 12         # 1 1 2 3 5 8 13 21 34 55 89 144
p find_fibonacci_index_by_length(10) == 45
p find_fibonacci_index_by_length(100) == 476
p find_fibonacci_index_by_length(1000) == 4782
p find_fibonacci_index_by_length(10000) == 47847