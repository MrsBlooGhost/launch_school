# P-------------
# Write a method that searches for all multiples of 3 or 5 that lie between 1
# and a given number, then computes the sum of those multiples.

# Explicit:
# - Assume that the number passed in is an integer greater than 1.

# Implicit:
# - The multiples that are added are unique multiples.

# E-------------
# multisum(3) == 3
# multisum(5) == 8
# multisum(10) == 33
# multisum(20) == 98
# multisum(1000) == 234168

# D-------------

# A-------------
# 1. Define a method `multisum` that takes one parameter.
# 2. Iterate from 1 up to the input integer,
#   - Pushing multiples of 3 into an array `multiples_of_3`.
#   - Pushing multiples of 5 into an array `multiples_of_5`.
# 3. Initiate a variable `sum` to the sum of adding unique values from both
# arrays in Step 2.
# 4. Return `sum`.

# C-------------
def multiple?(number, divisor)
  number % divisor == 0
end

def multisum(number)
  multiples = []
  1.upto(number) do |num|
    multiples << num if multiple?(num, 3) || multiple?(num, 5)
  end
  multiples.inject(0, :+)
end

p multisum(3) == 3
p multisum(5) == 8
p multisum(10) == 33
p multisum(20) == 98
p multisum(1000) == 234168