=begin
--- P
Input: the starting value, the ending value, and the step value as well as a block
Return: the original range

--- E
step(1, 10, 3) { |value| puts "value = #{value}" }
  value = 1
  value = 4
  value = 7
  value = 10
--- D

--- A
- Initialize `current_value` to the starting value.
- While the `current_value` is less than or equal to the ending value,
  - Yield `current_value` to the block.
  - Increment `current_value` by the step value.
- Return the original range.
=end

def step(starting_value, ending_value, step_value)
  current_value = starting_value
  while current_value <= ending_value
    yield(current_value)
    current_value += step_value
  end
  [[starting_value, ending_value], step_value]
end

p step(1, 10, 3) { |value| puts "value = #{value}" }

# ----- Follow Up Q
# What do you think would be a good return value for this method, and why?

# Because this method performs an iteration, I think a good return value would be the calling object, or argument passed in in this case. Perhaps a nested array containing the three values, with the nested array containing the starting and ending value.

# ----- C2
# `start_point` is where we begin, `end_point` is the maximum value to step up to, and `increment` is the amount we want to step by on each iteration.
# `current_value` is yielded to the block, then incremented on each iteration.
# We don't want to step beyond `end_point`, so we exit the loop when `current_value + increment > end_point`.
# We chose to return `current_value`, but there's no particular reason for it other than it being a reasonably sensible value. `Range#step` returns `self` (the original Range object`, but that doesn't work for us here. Another reasonable value may be `nil` or the last value returned by the block. 

def step(start_point, end_point, increment)
  current_value = start_point
  loop do
    yield(current_value)
    break if current_value + increment > end_point
    current_value += increment
  end
  current_value
end