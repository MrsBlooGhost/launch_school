# ---------------- Problem
# Re-write the problem statement.
# Write a program that asks the user for their name and greets the user. If the
# user writes their name, ending with an exclamation mark, the computer will yell
# back at the user.

# Input: string
# Output: string

# Rules (implicit and explicit):
# Explicit:
# - if user inputs their name ending with an exclamation mark, output string will
# be in all caps representing yelling
# - if user simply imputs their name, greet user

# ---------------- Examples
# What is your name? Bob
# Hello Bob.

# What is your name? Bob!
# HELLO BOB. WHY ARE WE SCREAMING?

# ---------------- Scatchpad
# GREAT IDEA!!


# ---------------- Data Structures
# You may want to create something to bridge the gap between the input and the output.


# ---------------- Algorithm
# Write broad action steps to solve the problem, then create substeps for each broad action step.
# 1. Prompt user for their name.
# 2. Get rid of newline character, save user input in variable `name`.
# 3. If `name` ends in an exclamation mark, delete exclamation mark and display
# message in all caps to user.
# Otherwise, greet user.

# ---------------- Code

puts "What is your name?"
name = gets.chomp
if name.end_with?("!")
  puts "HELLO #{name.chop.upcase}. WHY ARE WE SCREAMING?"
else
  puts "Hello #{name}."
end