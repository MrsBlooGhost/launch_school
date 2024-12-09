# Problem Description:
# Write a method that takes a time using this minute-based format and returns the
# time of day in 24 hour format (hh:mm). Your method should work with any integer
# input.

# ---------------- Problem (establish rules, define boundaries) ----------------
# Re-write the problem statement.
# Write a method that takes a time, using the described minute-based format, and
# returns the time of day in a 24-hour format (hh:mm). Your method should work
# with any integer input.

# Input: an integer (positive, zero, or negative)
# Output: a string

# Rules
# Explicit:
# - You may not use Ruby's `Date` and `Time` classes.
# - Disregard Daylight Savings and Standard Time and other complications.
# - If the input integer (number of minutes) is positive, the time is after
# midnight. If it is negative, the time is before midnight.

# Implicit:
# - There are 60 min in 1 hour, 1440 min in 24 hours.
# - The input integer can be higher or lower than 1440 and -1440.

# ---------------- Examples (confirm/refute assumptions ----------------
# time_of_day(0) == "00:00"

# time_of_day(-3) == "23:57"

# time_of_day(35) == "00:35"

# time_of_day(-1437) == "00:03"

# time_of_day(3000) == "02:00"

# time_of_day(800) == "13:20"

# time_of_day(-4231) == "01:29"

# ---------------- Data Structures (reason with data logically) ----------------
# Create something to bridge the gap between input and output.



# ---------------- Algorithm (steps from input to output) ----------------
# Write broad action steps to solve the problem. Create substeps for each broad action step.
# 1. Define a method `time_of_day` that takes one parameter.
# 2. Use input integer to return the hour and the minute numbers.
# - If input integer is 0-1439, return (integer.divmod(60)).
# - If input integer is 1440 and greater, return (integer.divmod(1440)[1].divmod(60))
# - If input integer is between -1439 and 0, return (1440-absolute number of integer).divmod(60)
# - If input is -1440 and less, return (1440-absolute number of integer).divmod(1440)[1].divmod(60)
# 3. Format string to contain 2 integers (div), a colon, and 2 integers (mod).
# 4. Return string.


# ---------------- Code (translate algorithm to programming language) ----------------
def time_of_day(number)
  if number > 1440
    hour, min = number.divmod(1440)[1].divmod(60)
  elsif number >= 0 && number < 1440
    hour, min = number.divmod(60)
  elsif number > -1440 && number < 0
    hour, min = (1440-number.abs).divmod(60)
  else
    hour, min = (1440-number.abs).divmod(1440)[1].divmod(60)
  end
  "#{hour}:#{min}"
  format("%.2d:%.2d", hour, min)
end

p time_of_day(0) == "00:00"
p time_of_day(-3) == "23:57"
p time_of_day(35) == "00:35"
p time_of_day(-1437) == "00:03"
p time_of_day(3000) == "02:00"
p time_of_day(800) == "13:20"
p time_of_day(-4231) == "01:29"