# Problem Description:


# ---------------- Problem (establish rules, define boundaries) ----------------
# Re-write the problem statement.
# Given a positive integer or zero, write a method that converts it to a string
# representation.

# Input: a positive integer or zero
# Output: a string representation of input

# Rules
# Explicit:
# - You may not use `Integer#to_s`, `String()`, or `Kernel#format`.

# Implicit:


# ---------------- Examples (confirm/refute assumptions ----------------
# integer_to_string(4321) == '4321'
# 4: thousands = value / 1000
# 3: hundreds = ( value / 100 ) % 10
# 2: tens = ( value / 10 ) % 10
# 1: ones = value % 10

# integer_to_string(0) == '0'
# integer_to_string(5000) == '5000'


# ---------------- Data Structures (reason with data logically) ----------------
# Create something to bridge the gap between input and output.
# - Hash


# ---------------- Algorithm (steps from input to output) ----------------
# Write broad action steps to solve the problem. Create substeps for each broad action step.
# 1. Create a reference hash with integers 0-9 as keys and the string representation
# as values.
# 2. Obtain each digit of the integer separately.
#   - Obtain length of integer.
#   - Iterate through the integer (integer length) amount of times, counting down.
#   - integer / 10**(count-1) % 10
# 3. Access the hash using the individual digit as a key, and push the value to an
# array.
# 4. Join all the substrings of the array together into a string.
# 5. Return the string.


# ---------------- Code (translate algorithm to programming language) ----------------
REFERENCE = {0 => '0', 1 => '1', 2 => '2', 3 => '3', 4 => '4', 5 => '5', 6 => '6',
7 => '7', 8 => '8', 9 => '9', 10 => '10' }

def integer_to_string(string)
  string.rect
end

p integer_to_string(4321) #== '4321'
p integer_to_string(0) #== '0'
p integer_to_string(5000) #== '5000'