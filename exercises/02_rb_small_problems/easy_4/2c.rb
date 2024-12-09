# P----------
# Write a method that takes a year as input and returns the century.

# Input: an integer representing the year
# Output: a string

# Explicit:
# - The return value should be a string that begins with the century number and
# ends with `st`, `nd`, `rd`, or `th` as appropriate.
# - New centuries begin in years that end with `01`. (e.g. 1901-2000 comprise the
# 20th century)

# Implicit:

# E----------
# century(2000) == '20th'
# century(2001) == '21st'
# century(1965) == '20th'
# century(256) == '3rd'
# century(5) == '1st'
# century(10103) == '102nd'
# century(1052) == '11th'
# century(1127) == '12th'
# century(11201) == '113th'

# D----------

# A----------
# 1. Define a method `century` that takes one parameter.
# 2. Calculate the century number.
#   - If year ends with is evenly divisible by 100 (i.e. year % 100 == 0),
#   `century_number` is equal to `year` / 100.
#   - If years isn't evenly divisible by 100, `century_number` is equal to
#   `year` / 100 + 1.
# 3. Calculate the century ending.
#   - If `century_number` modulus 100 is either 13, 14, or 15, concatenate `th`.
#   - If `century_number` modulus 10 is 1, concatenate `st`
#   - If `century_number` modulus 10 is 2, concatenate `nd`
#   - If `century_number` modulus 10 is 3, concatenate `rd`
#   - Otherwise, concatenate `th`.
# 4. Return string from method.

# C----------
def century(year)
  century_num = year / 100
  century_num += 1 if year % 100 != 0
  (century_num.to_s) + century_suffix(century_num)
end

def century_suffix(century_num)
  return 'th' if [11, 12, 13].include?(century_num % 100)
  last_digit = century_num % 10

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