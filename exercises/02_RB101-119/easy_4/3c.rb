# P-----------
# Write a method that follows the leap year rule under the Gregorian Calendar and
# takes a year as input and returns true if it is a leap year and false if it isn't.


# Input: an integer representing a year
# Output: a boolean value

# Explicit:
# - Leap years occur in every year that's evenly divisible by 4, unless the year is also
# divisible by 100. If it's divisible by 100, then it's not a leap year unless it's
# evenly divisible by 400.

# E-----------
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

# D-----------

# A-----------
# 1. Define a method `leap_year?` that takes one parameter.
# 2. Use a conditional to determine if the input year is a leap year.
#   - If the year is divisible by 400, return `true` for it being a leap year.
#   - If the year is divisible by 100, return `false` for it not being a leap year.
#   - If the year is then divisible by 4, return `true` for it being a leap year.

# C-----------
def leap_year?(year)
  if year % 400 == 0
    true
  elsif year % 100 == 0
    false
  else
    year % 4 == 0
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