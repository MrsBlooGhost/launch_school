=begin
P-----

Rules:
- On the first iteration, the rightmost_digits are all the digits of the integer.
- On the second iteration, the rightmost_digits are all but the first digit.
- On the tird iteration, the rightmost_digits are all but the first two digits.

E-----
max_rotation(735291) == 321579
  - Rotation 1: integer 735291, integer length 6
  - Rotation 2: integer 352917, integer length 5
  - Rotation 3: integer 321759, integer length 4
  - ...
max_rotation(3) == 3
max_rotation(35) == 53
max_rotation(105) == 15 # the leading zero gets dropped
max_rotation(8_703_529_146) == 7_321_609_845

A-----
- Invoke `rotate_rightmost_digits` passing the integer and the length of the integer
in as arguments.
- Repeat the following:
  - Re-assign `result` to return value of the method.
  - Invoke `rotate_rightmost_digits` passing the integer from index 1 to 5 and
  the length of this integer in as arguments.
  - Stop repeating after rotating the final two digits.
- Return `result`.

C-----
=end

def max_rotation(integer)
  number_digits = integer.to_s.size
  number_digits.downto(2) do |x|
    integer = rotate_rightmost_digits(integer, x)
  end
  # integer_length = integer.to_s.size
  # integer_length.downto(2) do |n|
  #   integer = rotation_rightmost_digits(integer, n)
  # end
#   integer_length = integer.to_s.size
# integer_length.times do |count|
#   rotations = integer_length - count
#   integer = rotate_rightmost_digits(integer, rotations)
integer
end

def rotate_rightmost_digits(integer, n)
  digits_array = integer.to_s.chars
  digits_array[-n..-1] = rotate_array(digits_array[-n..-1])
  digits_array.join.to_i
end

def rotate_array(array)
  array[1..-1] + [array[0]]
end

p max_rotation(735291) #== 321579
p max_rotation(3) #== 3
p max_rotation(35) #== 53
p max_rotation(105) #== 15 # the leading zero gets dropped
p max_rotation(8_703_529_146) #== 7_321_609_845