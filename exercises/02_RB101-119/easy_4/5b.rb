# P----------
# Write a method that takes one parameter, an integer, and searches through all
# multiples of 3 or 5 that lie between 1 and the argument, and computes the sum
# of those multiples.

# E.g. if the argument is 20, the result should be 98 (3 + 5 + 6 + 9 + 10 + 12 +
# 15 + 18 + 20).

# Assume that the integer passed in is greater than 1.

# Input: an integer
# Output: the sum of all multiples of 3 or 5 between 1 and input integer

# Explicit:
# - The method computes the sum of all multiples of 3 and 5 between 1 and input
# integer
# - Assume that the number passed in is greater than 1.

# Implicit:
# - If a number is both a multiple of 3 and 5, only include that number once in
# summing all multiples
# - input integer is inclusive of multiples being summed

# E----------
# multisum(3) == 3
# multisum(5) == 8
# multisum(10) == 33
# multisum(1000) == 234168

# D----------

# A----------
# 1. Define a method `multisum` that takes one parameter.
# 2. Determine all multiples of 3 between 1 and input integer.
# 3. Determine all multiples of 5 between 1 and input integer.
# 4. Create an array of unique numbers from Steps 2 and 3.
# 5. Sum all the values in the array from Step 4. Return this value.

# C----------
def multisum(number)
  mult_of_3 = (1..number).to_a.select do |num|
    num % 3 == 0
  end

  mult_of_5 = (1..number).to_a.select do |num|
  num % 5 == 0
  end

  multiples = []
  sum = 0
  multiples << mult_of_3 << mult_of_5
  multiples.flatten.uniq.each do |multiple|
    sum += multiple
  end
  sum
end

p multisum(3) == 3
p multisum(5) == 8
p multisum(10) == 33
p multisum(20) == 98
p multisum(1000) == 234168