=begin
# ----- P
Background: The `Range#step` method lets you iterate over a range of values where each value in the iteration is the previous value plus a "step" value. It returns the original range.

Task: Write a method that does the same thing as `Range#step` but doesn't operate on a range.

Rules
-  Input: 3 arguments - a starting value, an ending value, and the step value to be applied to each iteration - and a block to which it will yield (or call) successive iteration values
- Return: ???

# ----- E
step(1, 10, 3) { |value| puts "value = #{value}" }

value = 1
value = 4
value = 7
value = 10

# ----- A1
- Define method with parameters `starting`, `ending`, and `step`.
- Initialize `current` to `starting`.
- Until `current` is greater than `ending`:
  - Yield to the block, passing in `current` as an argument.
  - Increment `current` by `step`.
- Return nested array: `[[starting, ending], step]`.

=end
# ----- C1
def step(starting, ending, step)
  current = starting
  until current > ending
    yield(current)
    current += step
  end
  [[starting, ending], step]
end

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

p step(1, 10, 3) { |value| puts "value = #{value}" }

# Output:
# value = 1
# value = 4
# value = 7
# value = 10