# P------------
# Write two methods that each take a time of day in 24 hour format and return
# the number of minutes before and after midight, respectively. Both methods
# should return a value in the range `0..1439`.

# Input: a string in "hh:mm" format representing the time
# Output: an integer

# Explicit:
# - You may not use ruby's `Date` and `Time` methods.

# E------------
# after_midnight('00:00') == 0
# before_midnight('00:00') == 0
# after_midnight('12:34') == 754
# before_midnight('12:34') == 686
# after_midnight('24:00') == 0
# before_midnight('24:00') == 0

# D------------

# A------------
# 1. Initialize a constant `MINUTES_PER_HOUR` to 60 and `MINUTES_PER_DAY` to 1440.

# 2. Define a method `before_midnight` that takes one parameter and a method
# `after_midnight` that takes one parameter.
# 3. Convert elements at index 0-1 to an integer and save in variable `hour`. Do
# the same for elements at index 3-4 and save in variable `minutes'.
# 4. Multiply `hour` by `MINUTES_PER_HOUR` and add `minutes`. Save in `total_minutes`.
#   - Return `total_minutes` modulo `1440` in method `after_midnight`.
#   - Return `MINUTES_PER_DAY` - `total_minutes` in method `before_midnight`.

# C------------
require 'pry'

MINUTES_PER_HOUR = 60
MINUTES_PER_DAY = 1440

def before_midnight(time)
  hour = time[0..1].to_i
  minutes = time[3..4].to_i
  total_minutes = (hour * MINUTES_PER_HOUR) + minutes
  return 0 if total_minutes == 0
  MINUTES_PER_DAY - total_minutes
end

def after_midnight(time)
  hour = time[0..1].to_i
  minutes = time[3..4].to_i
  return 0 if hour == 24
  total_minutes = (hour * MINUTES_PER_HOUR) + minutes
end

MINUTES_PER_HOUR = 60
HOURS_PER_DAY = 24
MINUTES_PER_DAY = MINUTES_PER_HOUR * HOURS_PER_DAY

def after_midnight(time_str)
  hours, minutes = time_str.split(':').map do |string|
    string.to_i
  end
  (hours * MINUTES_PER_HOUR + minutes) % MINUTES_PER_DAY
end

def before_midnight(time_str)
  delta_minutes = MINUTES_PER_DAY - after_midnight(time_str)
  delta_minutes = 0 if delta_minutes == MINUTES_PER_DAY
  delta_minutes
end


p after_midnight('00:00') == 0
p before_midnight('00:00') == 0
p after_midnight('12:34') == 754
p before_midnight('12:34') == 686
p after_midnight('24:00') == 0
p before_midnight('24:00') == 0