# Problem Description:
# Write a method that takes a year as input and returns the century. The return
# value should be a string that begins with the century number, and ends with
# `st`, `nd`, `rd`, or `th` as appropriate for that number.

# New centuries begin in years that end with `01`. So, the years 1901-2000
# comprise the 20th century.


# ---------------- Problem (establish rules, define boundaries) ----------------
# Re-write the problem statement.
# Given a year, write a method that returns the century as a string that begins
# with the century number and ends with `st`, `nd`, `rd`, or `th` as appropriate
# for that number. New centuries begin in years that end with `01` (e.g. 1901-2000
# comprise the 20th century).

# Input: an integer representing the year
# Output: a string representing the century

# Rules
# Explicit:
# - the output string should contain a number for the century and `st`, `nd`, `rd`,
# or `th` as appropriate for that number
# - a century begins with a year ending in 01 (e.g. 1901-2000 comprise the 20th
# century)

# Implicit:
# - if year is 01-100 inclusive, century is 1st
# - if year is 3 digits, consider hundreds place.
# - if year is 4 digits, consider thousands and hundreds place.
# - if year is 5 digits, consider ten-thousands, thousands, and hundreds place.

# ---------------- Examples (confirm/refute assumptions ----------------
# century(2000) == '20th'
# century(2001) == '21st'
# century(1965) == '20th'
# century(256) == '3rd'
# century(5) == '1st'
# century(10103) == '102nd'
# century(1052) == '11th'
# century(1127) == '12th'
# century(11201) == '113th'


# ---------------- Scratchpad ----------------
# Year 1-100 = 1st
#   100
# Year 101-200 = 2nd
# Year 201-300 = 3rd
#   256 / 100 + 1 == 3
# Year 301-400 = 4th
# Year 901-1000 = 10th
# Year 1001-1100 = 11th
#   1052 / 100 + 1 = 11
# Year 1101-1200 = 12th
# Year 9001-10000 = 100th
# Year 11201-11300 = 113th
#   11201 / 100 + 1 = 113

#   Endings:
#   1 - st
#   2 - nd
#   3 - rd
#   4-0 - th
#   11 - th
#   12 - th
#   13 - th


# ---------------- Data Structures (reason with data logically) ----------------
# Create something to bridge the gap between input and output.



# ---------------- Algorithm (steps from input to output) ----------------
# Write broad action steps to solve the problem. Create substeps for each broad action step.

# 1. Define a method `century` that takes one parameter.
# 2. If input integer modulus 100 is 0,
    # - Take input integer, divide by 100. This is the century number.
    # If input integer modulus 100 is not 0,
    # - Take input integer, divide it by 100, and add 1. This is the century number.
# 3. Use a conditional to determine what "ending" to concatenate onto the returned
# integer:
#   1 - `"st"`
#   2 - `"nd"`
#   3 - `"rd"`
#   4 to 0, 11, 12, and 13 - `"th"`
# 5. Return step 4 from the method.

# ---------------- Code (translate algorithm to programming language) ----------------

def century(year)
  year_number = year % 100 == 0 ? year / 100 : year / 100 + 1
  year_number = year_number.to_s
  if (year_number[-1] == "1") && (year_number[-2..-1] != "11")
    year_number + "st"
  elsif (year_number[-1] == "2") && (year_number[-2..-1] != "12")
    year_number + "nd"
  elsif (year_number[-1] == "3") && (year_number[-2..-1] != "13")
    year_number + "rd"
  else
    year_number + "th"
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