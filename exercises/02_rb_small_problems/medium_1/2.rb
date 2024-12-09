=begin
P-----
Write a method that can rotate the last `n` digits of a number.

Rules:
- You may use the `rotate_array` method from the previous exercise.
- Assume `n` is a positive integer.
- Last digit rotates to the front.
- Rotation occurs `n - 1` times.

Input: two integers
Return: one integer

E-----
rotate_rightmost_digits(735291, 1) == 735291
  - 735291

rotate_rightmost_digits(735291, 2) == 735219
  - 735291

rotate_rightmost_digits(735291, 3) == 735912
  - 735129
  - 735912

rotate_rightmost_digits(735291, 4) == 732915
  - 731529
  - 739152
  - 732915

rotate_rightmost_digits(735291, 5) == 752913
  - 713529
  - 791352
  - 729135
  - 752913

rotate_rightmost_digits(735291, 6) == 352917

A-----
MAIN METHOD
- Assign `leftmost_digits` elements at index 0...size of the digits of input
integer minus `n`.
- Return concatenation of `leftmost_digits` and the rotation of the rightmost digits.

HELPER METHOD
-
C-----
=end
def rotate_rightmost_digits(integer, n)
  digits_array = integer.to_s.chars
  digits_array[-n..-1] = rotate_array(digits_array[-n..-1])
  digits_array.join.to_i
end

def rotate_array(array)
  array[1..-1] + [array[0]]
end

p rotate_rightmost_digits(735291, 1) #== 735291
p rotate_rightmost_digits(735291, 2) #== 735219
p rotate_rightmost_digits(735291, 3) #== 735912
p rotate_rightmost_digits(735291, 4) #== 732915
p rotate_rightmost_digits(735291, 5) #== 752913
p rotate_rightmost_digits(735291, 6) #== 352917