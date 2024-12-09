# ---------------- Problem
# Re-write the problem statement.
# Print all the odd numbers from 1 to 99, inclusive, on a separate line.

# Input:
# Output: integers

# Rules (implicit and explicit):
# Explicit:
# - print odd numbers from 1 to 99, inclusive
# - print the numberes on a separate line

# ---------------- Examples



# ---------------- Scatchpad
# GREAT IDEA!!


# ---------------- Data Structures
# You may want to create something to bridge the gap between the input and the output.


# ---------------- Algorithm
# Write broad action steps to solve the problem, then create substeps for each broad action step.
# 1. Obtain odd numbers from 1 to 99, inclusively.
# 2. Print these numbers on a separate line.

# ---------------- Code

(1..99).to_a.each do |num|
  puts num if num.odd?
end