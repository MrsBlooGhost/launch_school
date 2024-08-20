# P-----------
# Write a method that takes a floating point number representing an angle between
# 0-360 degrees and returns a string representing that angle in degrees, minutes,
# and seconds.

# Input: a floating point number
# Output: a string

# Explicit:
# - Use a degree symbol (°) to represent degrees.
# - Use a single quote (') to represent minutes.
# - Use a double quote (") to represent seconds.
# - A degree has 60 minutes. A minute has 60 seconds.
# - Results may differ slightly depending on how you round values, but should be
# within a second or two of the results shown.
# - Use two digit numbers with leading zeros when formatting the minutes and
# seconds (e.g. 321°03'07").
# - Use this constant to represent the degree symbol: DEGREE = "\xC2\xB0"

# E-----------
# dms(30) == %(30°00'00")
# dms(76.73) == %(76°43'48")
# dms(254.6) == %(254°36'00")
# dms(93.034773) == %(93°02'05")
# dms(0) == %(0°00'00")
# dms(360) == %(360°00'00") || dms(360) == %(0°00'00")

# D-----------

# A-----------
# 1. Define some constants:
#   - DEGREE = "\xC2\xB0"
#   - ONE_DEGREE = 60 (minutes)
#   - ONE_MINUTE = 60 (seconds)
# 2. Define a method `dms` that takes one parameter `number`.
# 3. Set `number.divmod(1)` to `degrees` and `min_sec_portion`.
# 4. Set `minutes, sec_portion` to `(min_sec_portion * 60).divmod(1)`.
# 5. Set `seconds` to `sec_portion * 60`.
# 6. Format returned string using `degrees`, `minutes`, and `seconds`.

# C-----------
DEGREE = "\xC2\xB0"
MINUTE_PER_DEGREE = 60
SECONDS_PER_MINUTE = 60
SECONDS_PER_DEGREE = MINUTE_PER_DEGREE * SECONDS_PER_MINUTE

def dms(number)
  degrees, min_sec_portion = number.divmod(1)
  minutes, sec_portion = (min_sec_portion * 60).divmod(1)
  seconds = (sec_portion * 60).round
  # "#{degrees}" + DEGREE + sprintf("%02d", "#{minutes}") + "'" + sprintf("%02d", "#{seconds}") + "\""
  format(%(#{degrees}#{DEGREE}%02d'%02d"), minutes, seconds)
end

p dms(30) == %(30°00'00")
p dms(76.73) == %(76°43'48")
p dms(254.6) == %(254°36'00")
p dms(93.034773) == %(93°02'05")
p dms(0) == %(0°00'00")
p dms(360) == %(360°00'00") || dms(360) == %(0°00'00")