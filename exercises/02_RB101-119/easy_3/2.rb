# Problem Description:
# Write a program that prompts the user for two positive integers, and then prints
# the results of the following operations on those two numbers: addition,
# subtraction, product, quotient, remainder, and power. Do not worry about
# validating the input.


# ---------------- Problem (establish rules, define boundaries) ----------------
# Re-write the problem statement.
# Prompt the user for two positive integers. Then print the results of performing
# operations on the two integers: addition, subtraction, multiplication, division,
# remainder, and exponentiation. No need to valid input.

# Input: two positive integers
# Output: operations performed on input: addition, subtraction, multiplication,
# division, remainder, exponentiation

# Rules
# Explicit:
# - Addition uses the `+` operator
# - Subtraction uses the `-` operator
# - Multiplication uses the `*` operator
# - Division uses the `/` operator
# - Remainder uses the `%` operator
# - Exponentiation uses the `**` operator
# - Input is two positive integers

# Implicit:
# - Print the result of each operation on a separate line


# ---------------- Examples (confirm/refute assumptions ----------------
# ==> Enter the first number:
# 23
# ==> Enter the second number:
# 17
# ==> 23 + 17 = 40
# ==> 23 - 17 = 6
# ==> 23 * 17 = 391
# ==> 23 / 17 = 1
# ==> 23 % 17 = 6
# ==> 23 ** 17 = 141050039560662968926103


# ---------------- Scratchpad ----------------



# ---------------- Data Structures (reason with data logically) ----------------
# Create something to bridge the gap between input and output.



# ---------------- Algorithm (steps from input to output) ----------------
# Write broad action steps to solve the problem. Create substeps for each broad action step.
# 1. Prompt the user for two positive integers. Save first integer in variable
# `num_1` and second integer in variable `num_2`.
# 2. Perform addition, subtraction, multiplication, division, remainder, and
# exponentiation on the two integers, save result in variable `answer`.
# 3. Print the result of each operation on a separate line.


# ---------------- Code (translate algorithm to programming language) ----------------
puts "==> Enter the first number:"
num_1 = gets.to_i
puts "==> Enter the second number:"
num_2 = gets.to_i

answer = num_1 + num_2
puts "==> #{num_1} + #{num_2} = #{answer}"

answer = num_1 - num_2
puts "==> #{num_1} - #{num_2} = #{answer}"

answer = num_1 * num_2
puts "==> #{num_1} * #{num_2} = #{answer}"

answer = num_1 / num_2
puts "==> #{num_1} / #{num_2} = #{answer}"

answer = num_1 % num_2
puts "==> #{num_1} % #{num_2} = #{answer}"

answer = num_1 ** num_2
puts "==> #{num_1} ** #{num_2} = #{answer}"