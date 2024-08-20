# Problem Description:


# ---------------- Problem (establish rules, define boundaries) ----------------
# Re-write the problem statement.
# Write two methods that each take a time of day in 24 hour format, and return
# the number of minutes before and after midnight, respectively. Both methods should
# return a value in the range 0..1439

# Input: a string representing the time in a 24-hour format
# Output: the number of minutes before and after midnight, respectively

# Rules
# Explicit:
# - You may not use Ruby's `Date` and `Time` methods
# - Disregard Daylight Savings and Standard Time and other irregularities

# Implicit:
# - String ranges from `00:00` to `24:00`

# ---------------- Examples (confirm/refute assumptions ----------------
# after_midnight('00:00') == 0

# before_midnight('00:00') == 0
# - 1440 - 0 = 1440

# after_midnight('12:34') == 754
# - 12 * 60 = 720
# - 720 + 34 = 754
# before_midnight('12:34') == 686
# - 1440 - 754 = 686
# after_midnight('24:00') == 0
# - 24 * 60 = 1440 --> 0
# - 0 + 0 = 0

# before_midnight('24:00') == 0
# 1440 - 0 = 0

# ---------------- Scratchpad ----------------



# ---------------- Data Structures (reason with data logically) ----------------
# Create something to bridge the gap between input and output.



# ---------------- Algorithm (steps from input to output) ----------------
# Write broad action steps to solve the problem. Create substeps for each broad action step.
# 1. Define a method `after_midnight` that takes one parameter.
# 2. Extract the first two digits in the input, and multiply it by 60.
# 3. Extract the last two digits in the input, and add it to step 2.
# 4. Return the sum. If sum is 1440, return 0.

# 5. Define a method `before_midnight` that takes one parameter.
# 6. Repeat steps 2 and 3.
# 7. Subtract sum from 1440.
# 8. Return the difference. If difference is 1440, return 0.


# ---------------- Code (translate algorithm to programming language) ----------------
def after_midnight(time)
  time_in_min = (time[0..1].to_i * 60) + time[3..4].to_i
  return 0 if time_in_min == 1440
  time_in_min
end

def before_midnight(time)
  time_in_min = 1440 - ((time[0..1].to_i * 60) + (time[3..4].to_i))
  return 0 if time_in_min == 1440
  time_in_min
end

p after_midnight('00:00') == 0
p before_midnight('00:00') == 0
p after_midnight('12:34') == 754
p before_midnight('12:34') == 686
p after_midnight('24:00') == 0
p before_midnight('24:00') == 0