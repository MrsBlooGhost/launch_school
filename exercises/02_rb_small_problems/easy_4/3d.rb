# P-----
# In the modern era under the Gregorian Calendar, leap years occur in every year
# that is evenly divisible by 4, unless the year is also divisible by 100. If the
# year is evenly divisible by 100, then it is not a leap year unless the year is
# evenly divisible by 400.

# Assume this rule is good for any year greater than year 0. Write a method that
# takes any year greater than 0 as input, and returns true if the year is a leap
# year, or false if it is not a leap year.

# Write a method that takes an integer as an argument and returns true if the year
# is a leap year and false if it isn't.

# implicit:

# explicit:
# - Leap years occur every year divisible by 4, unless the year is also divisible by 100
# - If the year is evenly divisible by 100, it's not a leap year unless also divisible
# by 400.
# - Leap year rule applies for any year > 0.

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
# leap_year?(1700) == false
# leap_year?(1) == false
# leap_year?(100) == false
# leap_year?(400) == true

# D-----

# A-----
# 1- Define a method that takes one parameter.
# 2- Determine if the year is a leap year.
#   - If `year` is divisible by 400, return true.
#   - If `year` is divisible by 100, return false.
#   - If `year` is divisible by 4, return true.
#   - Otherwise, return false.

# C-----
def leap_year?(year)
  return true if year % 400 == 0
  return false if year % 100 == 0
  return true if year % 4 == 0
  false
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