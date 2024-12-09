# P-----------
# Write a method that takes one parameter, a year greater than 0, and determines
# if that year is a leap year or not. The method returns `true` if it is, and
#   `false` if it isn't. Leap years occur in every year that is evenly divisible
#   by 4 unless the year is also divisible by 100. If it is divisible by 100,
#   then it's not a leap year unless it's also evenly divisible by 400.

# Assume this rule applies for any year greater than 0.

# Input: an integer greater than 0, representing a year
# Output: a boolean value

# Explicit:
# - The method takes any year greater than 0 as input
# - The method returns `true` if the year is a leap year and `false` if it isn't
# - The year is a leap year if it is divisible by 4 and not divisible by 100
# - The year is a leap year if it's divisible by 4, divisible by 100, and is
# divisible by 400

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
# 1. Write a method `leap_year?` that takes one parameter, representing a year.
# 2. Determine if input year is a leap year.
#   Is leap year if all of the below criteria are met:
#   - Divisible by 4
#   - Not divisible by 100
#   Is leap year if all of the below criteria are met:
#   - Divisible by 4
#   - Divisible by 100
#   - Divisible by 400
# 3. Return `true` if input is a leap year, and `false` if it is not.

# C-----------
# def leap_year?(year)
#   if year % 4 == 0 && year % 100 != 0
#     true
#   elsif year % 4 == 0 && year % 100 == 0 && year % 400 == 0
#     true
#   else
#     false
#   end
# end

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