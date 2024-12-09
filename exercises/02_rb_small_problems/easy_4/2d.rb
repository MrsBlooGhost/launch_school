# P------
# Write a method that takes a year as input and returns the century. The return
# value should be a string that begins with the century number, and ends with st,
# nd, rd, or th as appropriate for that number.

# New centuries begin in years that end with 01. So, the years 1901-2000 comprise
# the 20th century.

# Write a method that takes a year as input and returns its century.

# implicit:

# explicit:
# - New centuries begin in years that end with 01
#   - Ex: 20th century- years 1901-2000

# input: an integer representing a year
# return: a string that begins with the century number and an ending (st, nd, rd
# or th)

# E------
# century(2000) == '20th'
#   - century- 2000 / 100

# century(2001) == '21st'
#   - century- 2001 / 100 + 1

# century(1965) == '20th'
#   - century- 1965 / 100 + 1

# century(256) == '3rd'
#   - century- 256 / 100 + 1

# century(5) == '1st'
#   - century- 5 / 100 + 1

# century(10103) == '102nd'
#   - century- 10103 / 100 + 1

# century(1052) == '11th'
#   - century- 1052 / 100 + 1

# century(1127) == '12th'
#   - century- 1127 / 100 + 1

# century(11201) == '113th'
#   - century- 11201 / 100 + 1

# - ending th- last digit 4-0 & centuries 11, 12, 13
# - ending st- last digit 1
# - ending nd- last digit 2
# - ending rd- last digit 3

# D------

# A------
# 1- Define a method that takes one parameter `year`.
# 2- Establish the century.
#   - If `year` ends with `0`, `century` equals `year / 100`.
#   - If `year` doesn't end with `0`, `century` equals `year / 100 + 1`.
# 3- Establish century ending.
#   - If `century` ends with `4`, `5`, `6`, `7`, `8`, `9`, `0`, or is equal to
#   `11`, `12`, or `13`, ends with `th`.
#   - If last digit of `century` is `1`, ends with `st`.
#   - If last digit of `century` is `2`, ends with `nd`.
#   - If last digit of `century` is `3`, ends with `rd`.
# 4- Return new string that is `century` and `century_ending` concatenated.

# C------
def century(year)
  year % 10 == 0 ? century = year / 100 : century = year / 100 + 1
  century.to_s + century_suffix(century)
end

def century_suffix(century)
  return 'th' if [11, 12, 13].include?(century % 100)

  last_digit = century % 10
  case last_digit
  when 1 then 'st'
  when 2 then 'nd'
  when 3 then 'rd'
  else        'th'
  end
end

p century(2000) == '20th'
p century(2001) == '21st'
p century(1965) == '20th'
p century(256) == '3rd'
p century(5) == '1st'
p century(10103) == '102nd'
p century(1052) == '11th'
p century(1127) == '12th'
p century(11201) == '113th'
