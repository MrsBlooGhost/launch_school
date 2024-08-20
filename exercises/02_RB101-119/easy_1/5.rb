# ---------------- Problem
# Re-write the problem statement.
# Given a string, write a method that prints it within a box.

# Input: string
# Output: string within a box

# Rules (implicit and explicit):
# Implicit:
# - string can be empty
# - string is printed in middle of box
# - horizontal edges of box are off by 1 space on top and bottom of string
# - horizontal edges are made of `-`
# - vertical edges are off by 1 whitespace on either side of string
# - vertical edge are made of `|`
# - `+` on all four corners of box

# ---------------- Examples
# print_in_box('To boldly go where no one has gone before.')
# +--------------------------------------------+
# |                                            |
# | To boldly go where no one has gone before. |
# |                                            |
# +--------------------------------------------+

# print_in_box('')
# +--+
# |  |
# |  |
# |  |
# +--+


# ---------------- Scatchpad
# GREAT IDEA!!


# ---------------- Data Structures
# You may want to create something to bridge the gap between the input and the output.


# ---------------- Algorithm
# Write broad action steps to solve the problem, then create substeps for each broad action step.

# 1. Define a method `print_in_box` that takes one argument, a string.
# 2. Print the string in the middle of the box.
#   - Print string on line 3.
#   - Print horizontal edges on lines 1 and 5.
#     - String comprises of beginning `+` and ending `+` as well as (length of
#       string + 2) `-`s
#       longer than length of string
#   - On lines 2 and 4, print beginning `|` and ending `+` as well as (length of
#     string + 2) whitespaces
#   - On line 3, print beginning `|` and ending `|` as well as 1 whitespace, the
#     string, and another whitespace.

# ---------------- Code

def print_in_box(string)
  puts "+" + ("-" * (string.length + 2)) + "+"
  puts "|" + (" " * (string.length + 2)) + "|"
  puts "|" + string.center(string.length + 2) + "|"
  puts "|" + (" " * (string.length + 2)) + "|"
  puts "+" + ("-" * (string.length + 2)) + "+"
end

 print_in_box('To boldly go where no one has gone before.')
 print_in_box('')