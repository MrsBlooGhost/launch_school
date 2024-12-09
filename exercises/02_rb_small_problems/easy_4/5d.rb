# P-----
# Write a method that searches for all multiples of 3 or 5 that lie between 1 and
# some other number, and then computes the sum of those multiples. For instance,
# if the supplied number is `20`, the result should be `98`
#   (3 + 5 + 6 + 9 + 10 + 12 + 15 + 18 + 20).

# You may assume that the number passed in is an integer greater than 1.

# Write a method that searches for all multiples of 3 or 5 that lie between 1 and
# another number, then computes the sum of those multiples.

# implicit:
# - No repeating multiples
# - The multiples go up to and include the passed in number

# explicit:
# - Assume the number passed in is greater than 1

# input: an integer
# return: an integer

# E-----
# multisum(20) == 98
#   3, 6, 9, 12, 15, 18
#   5, 10, 15, 20
#   3 + 5 + 6 + 9 + 10 + 12 + 15 + 18 + 20

# multisum(3) == 3
#   3

# multisum(5) == 8
#   3
#   5
#   3 + 5

# multisum(10) == 33
#   3, 6, 9
#   5, 10
#   3 + 5 + 6 + 9 + 10

# multisum(1000) == 234168

# D-----

# A-----
# 1- Define a method that takes an integer `number` as an argument.
# 2- Initialize an array `multiples_of_3` and push any multiples of 3 from `number`.
# Initialize an array `multiples_of_5` and push any multiples of 5 from `number`.
# 3- Initialize an array `multiples` and push unique numbers from `multiples_of_3`
# and `multiples_of_5`.
# 4- Add all numbers in `multiples` and return this number.

# C-----
def multiples_of_3(number)
  multiples_of_3 = []

  1.upto(number) do |num|
    multiples_of_3 << num if num % 3 == 0
  end

  multiples_of_3
end

def multiples_of_5(number)
  multiples_of_5 = []

  1.upto(number) do |num|
    multiples_of_5 << num if num % 5 == 0
  end

  multiples_of_5
end

def multisum(number)
  multiples = []
  multiples.push(multiples_of_3(number)).push(multiples_of_5(number)).flatten.uniq.inject(:+)
end

p multisum(3) == 3
p multisum(5) == 8
p multisum(10) == 33
p multisum(1000) == 234168