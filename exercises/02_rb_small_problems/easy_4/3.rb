# Problem Description:
# In the modern era under the Gregorian Calendar, leap years occur in every year
# that is evenly divisible by 4, unless the year is also divisible by 100. If the
# year is evenly divisible by 100, then it is not a leap year unless the year is
# evenly divisible by 400.

# Assume this rule is good for any year greater than year 0. Write a method that
# takes any year greater than 0 as input, and returns true if the year is a leap
# year, or false if it is not a leap year.


# ---------------- Problem (establish rules, define boundaries) ----------------
# Re-write the problem statement.
# Given an integer greater than 0 that represents the year, write a method that
# determines if the given year is a leap year or not. It should return `true` if
# the year is a leap year and `false` if it is not.

# Input: an integer > 0
# Output: a boolean value

# Rules
# Explicit:
# - It is a leap year if year is divisible by 4, unless year is divisible by 100.
# It leap year is divisible by 100, then it's not a leap year unless the year is
# divisble by 400.
# - The above rules apply for any year > 0
# - method returns `true` if year is a leap year, and `false` otherwise

# Implicit:


# ---------------- Examples (confirm/refute assumptions ----------------
# leap_year?(2016) == true
# leap_year?(2015) == false
# leap_year?(2100) == false
# leap_year?(2400) == true
# leap_year?(240000) == true
# leap_year?(240001) == false
# leap_year?(2000) == true
# leap_year?(1900) == false
# leap_year?(1752) == true
# leap_year?(1700) == false
# leap_year?(1) == false
# leap_year?(100) == false
# leap_year?(400) == true


# ---------------- Scratchpad ----------------


# ---------------- Algorithm (steps from input to output) ----------------
# Write broad action steps to solve the problem. Create substeps for each broad action step.
# 1. Define a method `leap_year?` that takes one parameter.
# 2. If year is divisible by 4 and not divisible by 100, return `true`.
# 3. If year is divisible by 4, and divisible by 100, check if it's divisible by
# 400.
#   - If so, return `true`.
#   - Otherwise, return `false`.


# ---------------- Code (translate algorithm to programming language) ----------------
def leap_year?(year)
  if year % 4 == 0 && year % 100 != 0
    true
  elsif year % 4 == 0 && year % 100 == 0
    year % 400 == 0
  else
    false
  end
end

p leap_year?(2016) == true
p leap_year?(2015) == false
p leap_year?(2100) == false
p leap_year?(2400) == true
p leap_year?(240000) == true
p leap_year?(240001) == false
p leap_year?(2000) == true
p leap_year?(1900) == false
p leap_year?(1752) == true
p leap_year?(1700) == false
p leap_year?(1) == false
p leap_year?(100) == false
p leap_year?(400) == true