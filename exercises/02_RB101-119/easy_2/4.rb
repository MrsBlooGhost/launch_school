# ---------------- Problem
# Re-write the problem statement.
# Build a program that prompts the user for their age and desired retirement age,
# and displays the current year, the year user should retire, and how many years
# left until user's retirement.

# Input: user's age, user's desired retirement age
# Output: year of retirement, years left to retirement

# Rules (implicit and explicit):
# Explicit:

# Implicit:
# - the difference the user's current age and desired age of retirement is equal to
# how many years until retirement she has left

# ---------------- Examples
# What is your age? 30
# At what age would you like to retire? 70

# It's 2016. You will retire in 2056.
# You have only 40 years of work to go!


# ---------------- Scatchpad
# GREAT IDEA!!


# ---------------- Data Structures
# You may want to create something to bridge the gap between the input and the output.


# ---------------- Algorithm
# Write broad action steps to solve the problem, then create substeps for each broad action step.

# 1. Prompt user for current age, convert to integer, save value in variable
# `current_age`.
# 2. Prompt user for desired retirement age, convert to integer, save value in
# varaible `retirement_age`
# 3. Define a method `retire` that takes two parameters, `current_age` and
# `retirement_age`.
# 4. Calculate the difference between `current_age` and `retirement_age`, save
# value in variable `years_to_go`.
# 5. Initialize constant variable `current_year` to 2023.
# 6. Add `years_to_go` and `current_year`, save value in variable `retirement_year`.
# 7. Display statements as shown in example, using interpolation.

# ---------------- Code
CURRENT_YEAR = 2023

puts "What is your age?"
current_age = gets.to_i
puts "At what age would you like to retire?"
retirement_age = gets.to_i

def retire(current_age, retirement_age)
  years_to_go = retirement_age - current_age
  retirement_year = years_to_go + CURRENT_YEAR
  puts "It's #{CURRENT_YEAR}. You will retire in #{retirement_year}."
  puts "You only have #{years_to_go} years of work to go!"
end

retire(current_age, retirement_age)