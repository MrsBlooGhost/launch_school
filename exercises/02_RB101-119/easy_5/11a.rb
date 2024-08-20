# P------------
# Write a method that takes one argument, a positive integer, and returns a list of
# the digits in the number.

# Input: a positive integer
# Output: an array of integers

# Explicit:
# - The input integer is positive

# E------------
# puts digit_list(12345) == [1, 2, 3, 4, 5]     # => true
# puts digit_list(7) == [7]                     # => true
# puts digit_list(375290) == [3, 7, 5, 2, 9, 0] # => true
# puts digit_list(444) == [4, 4, 4]             # => true

# D------------

# A------------
# 1. Define a method `digit_list` that takes one parameter.
# 2. Iterate through the input integer.
#   - Use integer % 10 to obtain `num`.
#   - Prepend `num` to a new array.
#   - Use integer / 10 to get the new integer to iterate through.
#   - Continue until both integer % 10 and integer / 10 == 0.
# 3. Return array from Step 2.

# C------------
# def digit_list(integer)
#   list_of_digits = []
#   num = integer
#   loop do
#     list_of_digits.prepend(num % 10)
#     num = num / 10
#   break if num % 10 == 0 && num / 10 == 0
#   end
#   list_of_digits
# end

p digit_list(12345) #== [1, 2, 3, 4, 5]     # => true
p digit_list(7) #== [7]                     # => true
p digit_list(375290) #== [3, 7, 5, 2, 9, 0] # => true
p digit_list(444) #== [4, 4, 4]             # => true