# ---------------- Problem
# Re-write the problem statement:
# Given a string and a positive integer, write a method that takes two arguments
# and prints the string 'integer' amount of times.

# Input: a string, a positive integer
# Output: string

# Rules (implicit and explicit):
# Explicit:
# - the input integer is positive (1 and greater)
# - the output string should be printed as many times as the given integer
# Implicit:
# - the string is not an empty string

# ---------------- Examples
# repeat('Hello', 3)
# output:
# Hello
# Hello
# Hello

# ---------------- Scatchpad
# GREAT IDEA!!


# ---------------- Data Structures
# You may want to create something to bridge the gap between the input and the output.

# None

# ---------------- Algorithm
# Write broad action steps to solve the problem, then create substeps for each broad action step.

# 1. Define a method `repeat` that takes two arguments, a string and a positive integer.
# 2. Output string.
# 3. Repeat step 2 'integer' amount of times.

# ---------------- Code
def repeat(string, integer)
  integer.times do
    puts string
  end
end

repeat('Hello', 3)