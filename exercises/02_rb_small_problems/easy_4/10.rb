# Problem Description:


# ---------------- Problem (establish rules, define boundaries) ----------------
# Re-write the problem statement.
# Write a method take converts integers to a string without using the `Integer#to_s`,
# `String()`, or `Kernel#format` methods. You can use the `integer_to_string` method
# from the previous exercise.

# Input:
# Output:

# Rules
# Explicit:
# - Input integers can now be negative
# - You may not use the `Integer#to_s`, `String()`, or `Kernel#format` methods.
# - You may use the `integer_to_string` method from the previous exercise.

# Implicit:


# ---------------- Examples (confirm/refute assumptions ----------------
# signed_integer_to_string(4321) == '+4321'
# signed_integer_to_string(-123) == '-123'
# signed_integer_to_string(0) == '0'


# ---------------- Scratchpad ----------------



# ---------------- Data Structures (reason with data logically) ----------------
# Create something to bridge the gap between input and output.



# ---------------- Algorithm (steps from input to output) ----------------
# Write broad action steps to solve the problem. Create substeps for each broad action step.
# 1. If the input integer is less than zero, add a `-` to the front of the string.
# 2. If the input integer is greater than zero, add a `+` to the front of the string.
# 3. If the input integer is zero, just return `0`.


# ---------------- Code (translate algorithm to programming language) ----------------

DIGITS = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9']

def integer_to_string(number)
  result = ''
  loop do
    number, remainder = number.divmod(10)
    result.prepend(DIGITS[remainder])
    break if number == 0
  end
  result
end

def signed_integer_to_string(num)
  if num < 0
    integer_to_string(num).prepend("-")
  elsif num > 0
    integer_to_string(num).prepend("+")
  else
    integer_to_string(num)
  end
end

# p signed_integer_to_string(4321) == '+4321'
p signed_integer_to_string(-123) == '-123'
p signed_integer_to_string(0) == '0'