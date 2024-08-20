# P---------------
# Update the method `leap_year?` from the previous exercise so that leap years are
# determined based on the Julian Calendar for years prior to 1752 and based on the
# Gregorian Calendar for years 1752 and beyond.

# Under the Julian Calendar, a leap year is any year that's evenly divisble by 4.

# Input: an integer representing the year
# Output: a boolean value

# Explicit:
# - For years prior to 1752, use the Julian Calendar to determine if a year is a
# leap year. Under the Julian Calendar, a leap year is any year that's divisible
# by 4.
# - For years 1752 and beyond, use the Gregorian Calendar to determine if a year is
# a leap year. This method was written in the previous exercise.

# E---------------
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

# D---------------

# A---------------
# 1. Update the method `leap_year?` so that it determines leap years based on the
# Julian Calendar for years prior to 1752.
#   - A leap year is a year that's evenly divisible by 4.
# 2. Update the method `leap_year` so that it determines leap years based on the
# Gregorian Calendar for years 1752 and beyond.
#   - This is already written in the previous exercise.
# 3. If the year is a leap year, return `true`.

# C---------------
def leap_year?(year)
  if year < 1752
    year % 4 == 0
  else year >= 1752
    if year % 4 == 0 && year % 100 != 0
      true
    elsif year % 4 == 0 && year % 100 == 0 && year % 400 == 0
      true
    else
      false
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