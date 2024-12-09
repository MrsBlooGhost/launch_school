# P----------
# Write a method that an integer representing the time in minutes and returns the
# time in a 24 hour format (hh:mm).

# Input: an integer
# Output: a string in hh:mm format

# Explicit:
# - If the number of minutes is negative, the time is before midnight.
# - You may not use ruby's `Date` and `Time` classes.

# E----------
# time_of_day(0) == "00:00"
# time_of_day(-3) == "23:57"
# time_of_day(35) == "00:35"
# time_of_day(-1437) == "00:03"
# time_of_day(3000) == "02:00"
# time_of_day(800) == "13:20"
# time_of_day(-4231) == "01:29"

# D----------

# A----------
# 1. Define a method `time_of_day` that takes one parameter.
# 2. Determine `hour` and `minutes` for input integer.
#   - If input integer is between 0-1439, call `divmod(60)` on input to obtain `hour`
# and `minutes`.
#   - If input integer is >= 1440, perform modulo 1440 on input integer, then call
#   `divmod(60)` on the result to obtain `hour` and `minutes`.
#   - If input integer is between negative 0-1439, call `divmod(60)` on input. To
#   obtain `hour`, add `24` to the element at index 0 of the return value.
#   - If input integer is <= -1440, perform modulo -1440 on input integer, then call
#   `divmod(60)` on the result. To obtain `hour`, add `24` to the element at index
#   0 of the return value.
# 3. Format value from Step 2 in "hh:mm" format.

# C----------
# def time_of_day(minutes)
#   if minutes >= 0 && minutes < 1440
#     hour, minutes = minutes.divmod(60)
#   elsif minutes >= 1440
#     hour, minutes = (minutes % 1440).divmod(60)
#   elsif minutes < 0 && minutes > -1440
#     hour, minutes = minutes.divmod(60)
#     hour += 24
#   elsif minutes <= -1440
#     hour, minutes = (minutes % -1440).divmod(60)
#     hour += 24
#   end

#   format("%.2d", hour) + ":" + format("%.2d", minutes)
# end


p time_of_day(0) == "00:00"
p time_of_day(-3) == "23:57"
p time_of_day(35) == "00:35"
p time_of_day(-1437) == "00:03"
p time_of_day(3000) == "02:00"
p time_of_day(800) == "13:20"
p time_of_day(-4231) == "01:29"