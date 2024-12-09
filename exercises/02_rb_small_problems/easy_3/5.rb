# Problem Description:
# Using the multiply method from the "Multiplying Two Numbers" problem, write a
# method that computes the square of its argument (the square is the result of
# multiplying a number by itself).


# ---------------- Problem (establish rules, define boundaries) ----------------
# Re-write the problem statement.
# Using the `multiply` method from 4.rb, write a method that computes of the square
# of its arguments. The square ist he result of multiply a number by itself.

# Input: the return value of the `multiply` method - an integer
# Output: an integer that is the square of input integer

# Rules
# Explicit:
# - The square of a number is the result of multiplying that number by itself

# Implicit:


# ---------------- Examples (confirm/refute assumptions ----------------
# square(5) == 25
# square(-8) == 64


# ---------------- Scratchpad ----------------



# ---------------- Data Structures (reason with data logically) ----------------
# Create something to bridge the gap between input and output.

# Method from "Multiplying Two Numbers":
# def multiply(num1, num2)
#   num1 * num2
# end


# ---------------- Algorithm (steps from input to output) ----------------
# Write broad action steps to solve the problem. Create substeps for each broad action step.
# 1. Define a method `square` that takes one argument, `number`.
# 2. Use exponentiation to square `number`.
# 3. Return `number`.


# ---------------- Code (translate algorithm to programming language) ----------------

def multiply(num1, num2)
  num1 * num2
end

def square(number)
  multiply(number, number)
end

p square(5) == 25
p square(-8) == 64