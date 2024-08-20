# P-------------
# Edit the method from the previous exercise so that years prior to 1752 go by the
# Julian Calendar. Under the Julian Calendar, leap years occur in any year that's
# evenly divisible by 4.

# Input: an integer representing the year
# Output: a boolean value

# Explicit:
# - For years prior to 1752, leap years occur in any year evenly divisible by 4.
# - For years 1752 and beyond, follow logic written in the previous exercise.

# E-------------
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

# D-------------

# A-------------
# 1. Edit the method `leap_year?` from the previous exercise so that if the input
# year falls before 1752, return `true` if it is evenly divisible by 4.
# 2. If input year is 1752 and beyond, follow the logic written in the previous
# exercise.

# C-------------
def leap_year?(year)
  if year < 1752
    year % 4 == 0
  else
    if year % 400 == 0
      true
    elsif year % 100 == 0
      false
    else
      year % 4 == 0
    end
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
p leap_year?(1700) == true
p leap_year?(1) == false
p leap_year?(100) == true
p leap_year?(400) == true