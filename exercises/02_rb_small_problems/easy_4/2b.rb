# P-----------
# Write a method that takes one parameter, a year, and returns the century as a string
# that begins with the century number and ends with `st`, `nd`, `rd`, `th` as
# appropriate for that number. New centuries begin in years that end with `01`.

# Input: an integer
# Output: a string representing the century number and century number ending

# Explicit:
# - New centuries begin in years that end with `01`.
#   - Year 0-100 = Century 1
#   - Year 101-200 = Century 2
#   - Year 900-1000 = Century 10

# Implicit:
# - 13, 14, and 15 as well as any century that ends with 6, 7, 8, 9, 0 end with `th`
# - Century 11, 12, and 13 ends in `th` as well as centuries that end with 4, 5, 6,
# 7, 8, 9, 0
# - All other centuries that end with `1` end with `st`
# - All other centuries that end with `2` end with `nd`
# - All other centuries that end with `3` end with `rd`

# E-----------
# century(2000) == '20th'
# century(2001) == '21st'
# century(1965) == '20th'
# century(256) == '3rd'
# century(5) == '1st'
# century(10103) == '102nd'
# century(1052) == '11th'
# century(1127) == '12th'
# century(11201) == '113th'

# D-----------

# A-----------
# 1. Define a method `century` that takes one parameter.
# 2. Determine the century that input year corresponds to.
#   - Convert input year to a string.
#   - If the century ends with 0, `century_num` = `year` / 100
#   - If the century doesn't end with 0, `century_num` = `year` / 100 + 1
# 3. Determine the century ending corresponding to the century.
#   - If century ends with 11, 12, 13, 4, 5, 6, 7, 8, 9, 0, the ending is `th`
#   - If century ends with 1, the ending is `st`
#   - If century ends with 2, the ending is `nd`
#   - If century ends with 3, the ending is `rd`

# C-----------

def century(year)
  year.to_s[-1] == "0" ? century_num = year / 100 : century_num = year / 100 + 1
  string_cent_num = century_num.to_s
  if string_cent_num.end_with?("11", "12", "13", "4", "5", "6", "7", "8", "9", "0")
    string_cent_num + "th"
  elsif string_cent_num.end_with?("1")
    string_cent_num + "st"
  elsif string_cent_num.end_with?("2")
    string_cent_num + "nd"
  else string_cent_num.end_with?("3")
    string_cent_num + "rd"
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