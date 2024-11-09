=begin
--- P
Input: the starting value, the ending value, and the step value as well as a block
Return: 

--- E
step(1, 10, 3) { |value| puts "value = #{value}" }
  value = 1
  value = 4
  value = 7
  value = 10
--- D

--- A
- Initialize `current_value` to the starting value.
- Unless the `current_value` is greater than the ending value,
  - Yield `current_value` to the block.
  - Increment `current_value` by the step value.
=end

def step(starting_value, ending_value, step_value)
  current_value = starting_value
  unless current_value > ending_value
    yield(current_value)
    current_value += step_value
  end
end

p step(1, 10, 3) { |value| puts "value = #{value}" }