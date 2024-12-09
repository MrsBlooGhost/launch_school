# ---------------- Problem
# Re-write the problem statement.
# Write a program that randomly generates an age between 20 and 200, and prints
# it within a string.

# Input: random number between 20 and 200
# Output: a string with the age interpolated

# Rules (implicit and explicit):


# ---------------- Examples
# Teddy is 69 years old!


# ---------------- Scatchpad
# GREAT IDEA!!


# ---------------- Data Structures
# You may want to create something to bridge the gap between the input and the output.


# ---------------- Algorithm
# Write broad action steps to solve the problem, then create substeps for each broad action step.

# 1. Generate a random number between 20 and 200, and save it in a variable `age`.
# 2. Print `age` using string interpolation.

# ---------------- Code

age = (21...200).to_a.sample
puts "Teddy is #{age} years old!"