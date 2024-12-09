# P-----
# The British Empire adopted the Gregorian Calendar in 1752, which was a leap
# year. Prior to 1752, the Julian Calendar was used. Under the Julian Calendar,
# leap years occur in any year that is evenly divisible by 4.

# Using this information, update the method from the previous exercise to determine
# leap years both before and after 1752.

# implicit:

# explicit:
# - For years prior to 1752, leap years occurred in any year divisible by 4.
# - Starting 1752 and on, follow the method from Problem 3.

# input: an integer representing a year
# return: a boolean value

# E-----
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

# D-----

# A-----
# 1- Take method from previous exercise and name it `gregorian_leap_years`.
# 2- Define a method that takes one parameter.
# 3- If input year is 1752 or greater, use `gregorian_leap_years`.
# 4- If input year is less than 1752, use `julian_leap_years`.
#   - In `julian_leap_years`, if input year is divisible by 4, return true.

# C-----
def gregorian_leap_years(year)
  return true if year % 400 == 0
  return false if year % 100 == 0
  return true if year % 4 == 0
  false
end

def julian_leap_years(year)
  year % 4 == 0
end

def leap_year?(year)
  year >= 1752 ? gregorian_leap_years(year) : julian_leap_years(year)
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