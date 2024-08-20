# Problem Description:
# Write a program that solicits 6 numbers from the user, then prints a message
# that describes whether or not the 6th number appears amongst the first 5 numbers.


# ---------------- Problem (establish rules, define boundaries) ----------------
# Re-write the problem statement.
# Prompt the user for 6 numbers. Then print a message that describes whether or
# not the 6th number appears amongst the first 5 numbers.

# Input: 6 integers
# Output: a string describing whether the 6th number appears amongst the first 5
# numbers, 5 numbers are displayed in an array

# Rules
# Explicit:

# Implicit:
# - Numbers are positive integers.


# ---------------- Examples (confirm/refute assumptions ----------------
# ==> Enter the 1st number:
# 25
# ==> Enter the 2nd number:
# 15
# ==> Enter the 3rd number:
# 20
# ==> Enter the 4th number:
# 17
# ==> Enter the 5th number:
# 23
# ==> Enter the last number:
# 17
# The number 17 appears in [25, 15, 20, 17, 23].


# ==> Enter the 1st number:
# 25
# ==> Enter the 2nd number:
# 15
# ==> Enter the 3rd number:
# 20
# ==> Enter the 4th number:
# 17
# ==> Enter the 5th number:
# 23
# ==> Enter the last number:
# 18
# The number 18 does not appear in [25, 15, 20, 17, 23].


# ---------------- Scratchpad ----------------



# ---------------- Data Structures (reason with data logically) ----------------
# Create something to bridge the gap between input and output.
# - Array
#   [first five numbers]


# ---------------- Algorithm (steps from input to output) ----------------
# Write broad action steps to solve the problem. Create substeps for each broad action step.
# 1. Initialize an empty array `numbers`.
# 2. Prompt the user for six numbers, adding the first five numbers to the `numbers`
# array. Save the sixth number in a variable `last_num`.
# 3. Check if `last_num` matches any of the elements in `numbers`.
# 4. Print a statement stating whether or not the sixth number appears in the array.

# ---------------- Code (translate algorithm to programming language) ----------------

numbers = []

puts "==> Enter the 1st number:"
numbers << gets.to_i
puts "==> Enter the 2nd number:"
numbers << gets.to_i
puts "==> Enter the 3rd number:"
numbers << gets.to_i
puts "==> Enter the 4th number:"
numbers << gets.to_i
puts "==> Enter the 5th number:"
numbers << gets.to_i
puts "==> Enter the last number:"
last_num = gets.to_i

puts numbers.include?(last_num) ? "The number #{last_num} appears in #{numbers}" :
"The number #{last_num} does not appear in #{numbers}."