# ---------------- Problem
# Re-write the problem statement.
# Write a program that prompts the user for an integer greater than 0, then asks
# if the user wants to determine the sum or product of all the numbers between 1
# and then given integer. Then determine the sum or product based on user's input.

# Input: a positive integer, string
# Output: integer that is the sum or product of all numbers between 1 and given
# integer

# Rules (implicit and explicit):
# Explicit:
# - input integer is positive
# - user determines if we sum or multiply all the numbers between 1 and given integer

# Implicit:

# ---------------- Examples
# >> Please enter an integer greater than 0:
# 5
# >> Enter 's' to compute the sum, 'p' to compute the product.
# s
# The sum of the integers between 1 and 5 is 15.


# >> Please enter an integer greater than 0:
# 6
# >> Enter 's' to compute the sum, 'p' to compute the product.
# p
# The product of the integers between 1 and 6 is 720.


# ---------------- Scatchpad
# GREAT IDEA!!


# ---------------- Data Structures
# You may want to create something to bridge the gap between the input and the output.


# ---------------- Algorithm
# Write broad action steps to solve the problem, then create substeps for each broad action step.
# 1. Prompt user to enter an integer greater than 0. Convert input to integer and
# save it in variable `number`.
# 2. Prompt user to enter `'s'` to compute the sum or `'p'` to compute the
# product of all integers between 1 and given integer, save value in variable
# `computation`.
# 3. If user enters `'s'`, add all numbers between 1 and given integer, inclusive.
# 4. If user enters `'p'`, multiply all numbers between 1 and given integer, inclusive.
# ---------------- Code

puts ">> Please enter an integer greater than 0:"
number = gets.to_i
puts ">> Enter 's' to compute the sum, 'p' to compute the product."
computation = gets.chomp
if computation == 's'
  sum = (1..number).reduce(:+)
  puts "The sum of the integers between 1 and #{number} is #{sum}."
else
  product = (1..number).reduce(:*)
  puts "The product of the integers between 1 and #{number} is #{product}."
end