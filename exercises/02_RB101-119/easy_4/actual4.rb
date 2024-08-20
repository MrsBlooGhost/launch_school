# Problem Description:
# In the modern era under the Gregorian Calendar, leap years occur in every year
# that is evenly divisible by 4, unless the year is also divisible by 100. If the
# year is evenly divisible by 100, then it is not a leap year unless the year is
# evenly divisible by 400.The British Empire adopted the Gregorian Calendar in
# 1752, which was a leap year. Prior to 1752, the Julian Calendar was used. Under
# the Julian Calendar, leap years occur in any year that is evenly divisible by 4.

# Update the method from the previous exercise to determine leap years both
# before and after 1752.

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
# After 1752:
  # - It is a leap year if year is divisible by 4, unless year is divisible by 100.
  # It leap year is divisible by 100, then it's not a leap year unless the year is
  # divisble by 400.
  # - The above rules apply for any year > 0
  # - method returns `true` if year is a leap year, and `false` otherwise
# Before 1752:
  # - It is a leap year if year is divisible by 4.

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
# leap_year?(1700) == true
# leap_year?(1) == false
# leap_year?(100) == true
# leap_year?(400) == true


# ---------------- Scratchpad ----------------


# ---------------- Algorithm (steps from input to output) ----------------
# Write broad action steps to solve the problem. Create substeps for each broad action step.
# 1. Define a method `leap_year?` that takes one parameter.
# 2. For years after 1752,
  # If year is divisible by 4 and not divisible by 100, return `true`.
  # If year is divisible by 4, and divisible by 100, check if it's divisible by
  # 400.
  # - If so, return `true`.
  #   - Otherwise, return `false`.
# 3. For years before 1752,
  # If year is divisible by 4, return `true`. Otherwise, return `false`.


# ---------------- Code (translate algorithm to programming language) ----------------
def gregorian_leap_year?(year)
  if year % 4 == 0 && year % 100 != 0
    true
  elsif year % 4 == 0 && year % 100 == 0
    year % 400 == 0
  else
    false
  end
end

def julian_leap_year?(year)
  year % 4 == 0
end

def leap_year?(year)
  year <= 1752 ? julian_leap_year?(year) : gregorian_leap_year?(year)
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
p leap_year?(1700) == true
p leap_year?(1) == false
p leap_year?(100) == true
p leap_year?(400) == true